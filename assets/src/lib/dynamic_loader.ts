/* dynamic_loader.ts */
import { componentImports as carbonComponentImports } from "./_dynamic_loader_mapping";
import { productComponentImports } from "./_dynamic_loader_mapping_products";
import { ensureFormAssociatedTag } from "./form_associated";

type ComponentImporter = () => Promise<unknown>;

export interface WebComponentManagerOptions {
  hideUntilReady?: boolean;
  readyTimeoutMs?: number;
  loadingClass?: string;
  root?: ParentNode | null;
}

const componentImports = {
  ...carbonComponentImports,
  ...productComponentImports
};
const baseComponentNames = Object.keys(componentImports);
const formComponentNames = baseComponentNames.map((name) => `${name}-form`);
const componentNames = [...baseComponentNames, ...formComponentNames];
const componentSelector = componentNames.join(",");
const componentSet = new Set(componentNames);
const loadedComponents: Record<string, Promise<unknown>> = {};
const notificationTags = new Set(["c4p-notification"]);

function normalizeTagName(tagName: string): { tag: string; base: string; isForm: boolean } {
  const lower = tagName.toLowerCase();
  if (lower.endsWith("-form")) {
    return { tag: lower, base: lower.slice(0, -5), isForm: true };
  }
  return { tag: lower, base: lower, isForm: false };
}

export function isGrapheneComponentTag(tagName: string): boolean {
  return componentSet.has(tagName.toLowerCase());
}

function importerForTag(tagName: string): ComponentImporter | undefined {
  const { base } = normalizeTagName(tagName);
  return componentImports[base];
}

function loadComponentByTag(tagName: string): Promise<unknown> | undefined {
  const { tag, base, isForm } = normalizeTagName(tagName);

  if (!loadedComponents[base]) {
    const importer = importerForTag(base);
    if (!importer) {
      console.warn(`No importer found for component: ${base}`);
      return undefined;
    }

    loadedComponents[base] = importer()
      .then((module) => module)
      .catch((err) => {
        console.error(`Error loading ${base}:`, err);
        delete loadedComponents[base];
        throw err;
      });
  }

  const loadPromise = loadedComponents[base];

  if (isForm) {
    loadPromise.then(() => ensureFormAssociatedTag(tag));
  }

  return loadPromise;
}

function readNotificationTimestamp(el: Element): Date | null {
  if (!el.hasAttribute("timestamp")) {
    return null;
  }
  const raw = el.getAttribute("timestamp");
  if (!raw || raw === "null" || raw === "undefined") {
    return null;
  }
  const parsed = Date.parse(raw);
  if (Number.isNaN(parsed)) {
    return null;
  }
  return new Date(parsed);
}

function normalizeNotificationTimestamp(el: Element): void {
  const tagName = el.tagName.toLowerCase();
  if (!notificationTags.has(tagName)) {
    return;
  }

  const apply = () => {
    const value = readNotificationTimestamp(el);
    try {
      (el as any).timestamp = value ?? undefined;
    } catch (_error) {
      // Ignore if the component rejects the property assignment.
    }
  };

  if (customElements.get(tagName)) {
    apply();
  } else {
    customElements.whenDefined(tagName).then(apply);
  }
}

function scanAndLoad(root: ParentNode | null): void {
  if (!root) {
    return;
  }

  if (root instanceof Element && isGrapheneComponentTag(root.tagName)) {
    normalizeNotificationTimestamp(root);
    loadComponentByTag(root.tagName);
  }

  if (!componentSelector || !("querySelectorAll" in root)) {
    return;
  }

  root
    .querySelectorAll(componentSelector)
    .forEach((el) => {
      normalizeNotificationTimestamp(el);
      loadComponentByTag(el.tagName);
    });
}

function collectComponentTags(root: ParentNode | null): string[] {
  if (!root) {
    return [];
  }

  const tags = new Set<string>();

  if (root instanceof Element && isGrapheneComponentTag(root.tagName)) {
    tags.add(root.tagName.toLowerCase());
  }

  if (componentSelector && "querySelectorAll" in root) {
    root
      .querySelectorAll(componentSelector)
      .forEach((el) => tags.add(el.tagName.toLowerCase()));
  }

  return Array.from(tags);
}

async function waitForComponent(tagName: string): Promise<void> {
  const loadPromise = loadComponentByTag(tagName);
  if (loadPromise) {
    await loadPromise;
  }
  await customElements.whenDefined(tagName);
}

export class WebComponentManager {
  private observer: MutationObserver | null = null;
  private options: WebComponentManagerOptions;
  private readyPromise: Promise<void> | null = null;

  constructor(options: WebComponentManagerOptions = {}) {
    this.options = options;
  }

  public connect(): void {
    const doConnect = () => {
      if (this.options.hideUntilReady) {
        this.applyLoadingClass();
        const ready = this.whenReady();
        const timeoutMs = this.options.readyTimeoutMs ?? 0;
        if (timeoutMs > 0) {
          Promise.race([
            ready,
            new Promise((resolve) => setTimeout(resolve, timeoutMs))
          ]).finally(() => this.clearLoadingClass());
        } else {
          ready.finally(() => this.clearLoadingClass());
        }
      }
      this.loadExistingComponents();
      this.observeDOM();
    };

    if (["complete", "interactive"].includes(document.readyState)) {
      doConnect();
    } else {
      document.addEventListener("DOMContentLoaded", doConnect);
    }
  }

  public disconnect(): void {
    this.observer?.disconnect();
    this.observer = null;
  }

  public whenReady(root: ParentNode | null = this.options.root ?? document.body): Promise<void> {
    if (this.readyPromise) {
      return this.readyPromise;
    }

    this.loadExistingComponents();
    const tags = collectComponentTags(root ?? document.documentElement);

    this.readyPromise = Promise.all(tags.map((tag) => waitForComponent(tag))).then(
      () => undefined
    );

    return this.readyPromise;
  }

  private loadExistingComponents(): void {
    scanAndLoad(document.body ?? document);
  }

  private observeDOM(): void {
    const observerCallback: MutationCallback = (mutationsList) => {
      for (const mutation of mutationsList) {
        if (mutation.type === "childList") {
          mutation.addedNodes.forEach((node) => {
            if (node instanceof Element || node instanceof DocumentFragment) {
              scanAndLoad(node);
            }
          });
        } else if (mutation.type === "attributes") {
          const target = mutation.target;
          if (
            target instanceof Element &&
            mutation.attributeName === "timestamp"
          ) {
            normalizeNotificationTimestamp(target);
          }
        }
      }
    };

    const observerOptions: MutationObserverInit = {
      childList: true,
      subtree: true,
      attributes: true,
      attributeFilter: ["timestamp"]
    };
    const root = document.body ?? document.documentElement;
    if (!root) {
      return;
    }

    this.observer = new MutationObserver(observerCallback);
    this.observer.observe(root, observerOptions);
  }

  private applyLoadingClass(): void {
    const className = this.options.loadingClass ?? "graphene-loading";
    document.documentElement?.classList.add(className);
  }

  private clearLoadingClass(): void {
    const className = this.options.loadingClass ?? "graphene-loading";
    document.documentElement?.classList.remove(className);
  }
}
