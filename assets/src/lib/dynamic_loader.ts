/* dynamic_loader.ts */
import { componentImports } from "./_dynamic_loader_mapping";

type ComponentImporter = () => Promise<unknown>;

const componentNames = Object.keys(componentImports);
const componentSelector = componentNames.join(",");
const componentSet = new Set(componentNames);
const loadedComponents: Record<string, Promise<unknown>> = {};

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

function scanAndLoad(root: ParentNode | null): void {
  if (!root) {
    return;
  }

  if (root instanceof Element && isComponentTag(root.tagName)) {
    loadComponentByTag(root.tagName);
  }

  if (!componentSelector || !("querySelectorAll" in root)) {
    return;
  }

  root
    .querySelectorAll(componentSelector)
    .forEach((el) => loadComponentByTag(el.tagName));
}

export class WebComponentManager {
  private observer: MutationObserver | null = null;

  public connect(): void {
    const doConnect = () => {
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
