/* dynamic_loader.ts */
import { componentImports } from "./_dynamic_loader_mapping";

type ComponentImporter = () => Promise<unknown>;

const componentNames = Object.keys(componentImports);
const componentSelector = componentNames.join(",");
const componentSet = new Set(componentNames);
const loadedComponents: Record<string, Promise<unknown>> = {};
const numberInputTags = new Set(["cds-number-input", "cds-fluid-number-input"]);
const patchedNumberInputs = new Set<string>();
const definePatchFlag = "__graphenePatchedDefine";
const originalDefine = customElements.define.bind(customElements);

function isComponentTag(tagName: string): boolean {
  return componentSet.has(tagName.toLowerCase());
}

function importerForTag(tagName: string): ComponentImporter | undefined {
  return componentImports[tagName.toLowerCase()];
}

function loadComponentByTag(tagName: string): Promise<unknown> | undefined {
  const componentName = tagName.toLowerCase();

  if (!loadedComponents[componentName]) {
    const importer = importerForTag(componentName);
    if (!importer) {
      console.warn(`No importer found for component: ${componentName}`);
      return undefined;
    }

    loadedComponents[componentName] = importer()
      .then((module) => module)
      .catch((err) => {
        console.error(`Error loading ${componentName}:`, err);
        delete loadedComponents[componentName];
        throw err;
      });
  }

  return loadedComponents[componentName];
}

function normalizeNumberInputStep(el: Element): void {
  const tagName = el.tagName.toLowerCase();
  if (!numberInputTags.has(tagName)) {
    return;
  }

  const step = el.getAttribute("step");
  const safeStep =
    step === null || step === "" || step === "null" || step === "undefined"
      ? "1"
      : step;
  el.setAttribute("step", safeStep);

  const applyStep = () => {
    (el as any)._step = safeStep;
    (el as any).step = safeStep;
  };

  if (customElements.get(tagName)) {
    applyStep();
  } else {
    customElements.whenDefined(tagName).then(applyStep);
  }
}

function applyNumberInputDescriptor(proto: any): void {
  const descriptor = Object.getOwnPropertyDescriptor(proto, "step");
  if (!descriptor) {
    return;
  }

  const originalGet = descriptor.get;
  const originalSet = descriptor.set;

  Object.defineProperty(proto, "step", {
    configurable: descriptor.configurable ?? true,
    enumerable: descriptor.enumerable ?? true,
    get() {
      const value = (this as any)._step;
      if (value === null || value === undefined) {
        return "1";
      }
      return originalGet ? originalGet.call(this) : String(value);
    },
    set(value: unknown) {
      const safeValue =
        value === null || value === undefined || value === "" ? "1" : value;
      if (originalSet) {
        originalSet.call(this, safeValue);
      } else {
        (this as any)._step = safeValue;
      }
    }
  });

  if (!proto.__grapheneStepPatched) {
    const originalConnected = proto.connectedCallback;
    proto.connectedCallback = function (...args: unknown[]) {
      if (this._step === null || this._step === undefined) {
        const step = this.getAttribute?.("step") || "1";
        this._step = step;
        try {
          this.step = step;
        } catch (_error) {
          // ignore if the component rejects programmatic assignment
        }
      }
      return originalConnected ? originalConnected.apply(this, args) : undefined;
    };
    proto.__grapheneStepPatched = true;
  }
}

function patchNumberInputPrototype(tagName: string): void {
  if (!numberInputTags.has(tagName) || patchedNumberInputs.has(tagName)) {
    return;
  }

  const ctor = customElements.get(tagName) as { prototype?: any } | undefined;
  if (!ctor?.prototype) {
    return;
  }

  applyNumberInputDescriptor(ctor.prototype);
  patchedNumberInputs.add(tagName);
}

function ensureNumberInputPatched(tagName: string): void {
  if (!numberInputTags.has(tagName) || patchedNumberInputs.has(tagName)) {
    return;
  }

  customElements.whenDefined(tagName).then(() => {
    patchNumberInputPrototype(tagName);
  });
}

function ensureDefinePatched(): void {
  const registry = customElements as unknown as Record<string, unknown>;
  if (registry[definePatchFlag]) {
    return;
  }

  registry[definePatchFlag] = true;

  customElements.define = (name, ctor, options) => {
    if (numberInputTags.has(name) && ctor?.prototype) {
      applyNumberInputDescriptor(ctor.prototype);
      patchedNumberInputs.add(name);
    }

    return originalDefine(name, ctor, options);
  };
}

function scanAndLoad(root: ParentNode | null): void {
  if (!root) {
    return;
  }

  if (root instanceof Element && isComponentTag(root.tagName)) {
    normalizeNumberInputStep(root);
    ensureNumberInputPatched(root.tagName.toLowerCase());
    loadComponentByTag(root.tagName);
  }

  if (!componentSelector || !("querySelectorAll" in root)) {
    return;
  }

  root
    .querySelectorAll(componentSelector)
    .forEach((el) => {
      normalizeNumberInputStep(el);
      ensureNumberInputPatched(el.tagName.toLowerCase());
      loadComponentByTag(el.tagName);
    });
}

export class WebComponentManager {
  private observer: MutationObserver | null = null;

  public connect(): void {
    const doConnect = () => {
      ensureDefinePatched();
      ensureNumberInputPatched("cds-number-input");
      ensureNumberInputPatched("cds-fluid-number-input");
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

  private loadExistingComponents(): void {
    scanAndLoad(document.body ?? document);
  }

  private observeDOM(): void {
    const observerCallback: MutationCallback = (mutationsList) => {
      for (const mutation of mutationsList) {
        if (mutation.type !== "childList") {
          continue;
        }

        mutation.addedNodes.forEach((node) => {
          if (node instanceof Element || node instanceof DocumentFragment) {
            scanAndLoad(node);
          }
        });
      }
    };

    const observerOptions: MutationObserverInit = { childList: true, subtree: true };
    const root = document.body ?? document.documentElement;
    if (!root) {
      return;
    }

    this.observer = new MutationObserver(observerCallback);
    this.observer.observe(root, observerOptions);
  }
}

ensureDefinePatched();
ensureNumberInputPatched("cds-number-input");
ensureNumberInputPatched("cds-fluid-number-input");
