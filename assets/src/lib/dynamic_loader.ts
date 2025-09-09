/* dynamic_loader.ts */
import { componentImports } from "./_dynamic_loader_mapping";

interface DynamicWebComponentLoader {
  el: HTMLElement & { dataset: { component?: string } };
  loadComponent: () => void;
}

let loadedComponents: { [key: string]: Promise<any> } = {};

function loadComponent(el: HTMLElement): void {
  const componentName = el.tagName.toLowerCase();
  if (!loadedComponents[componentName]) {
    const importer = componentImports[componentName];
    if (importer) {
      // Start loading the component and store the promise
      loadedComponents[componentName] = importer().then(module => {
        // Additional setup can be done here if necessary
        // console.log(`Imported component ${componentName}.`)
        return module;
      }).catch(err => {
        console.error(`Error loading ${componentName}:`, err);
        // Remove the promise from the map if loading fails
        delete loadedComponents[componentName];
        throw err; // Re-throw the error to allow further handling
      });
    } else {
      console.warn(`No importer found for component: ${componentName}`);
      return; // Exit the function early if there's no importer
    }
  }

  // Wait for the component to load
  loadedComponents[componentName].then(() => {
    // The component has been loaded and any additional setup has been completed
  }).catch(err => {
    // Handle any errors that occurred during the loading process
  });

}

export class WebComponentManager {
  // Method to initiate the DOM observation for new components
  public connect(): void {
    let doConnect = () => {
      this.loadExistingComponents();
      this.observeDOM();
    }
    if (["complete", "loaded", "interactive"].includes(document.readyState)) {
      doConnect();
    } else {
      document.addEventListener("DOMContentLoaded", doConnect);
    }
  }

  private loadExistingComponents(): void {
    document.querySelectorAll<HTMLElement>('*').forEach((el) => {
      if (el.tagName.toLowerCase().startsWith('cds-')) {
        loadComponent(el);
      }
    });
  }

  private observeDOM(): void {
    const observerCallback: MutationCallback = (mutationsList) => {
      for (const mutation of mutationsList) {
        if (mutation.type === 'childList') {
          mutation.addedNodes.forEach((node) => {
            if (node instanceof HTMLElement && node.tagName.toLowerCase().startsWith('cds-')) {
              loadComponent(node);
            }
          });
        }
      }
    };

    const observerOptions: MutationObserverInit = { childList: true, subtree: true };
    const observer = new MutationObserver(observerCallback);
    observer.observe(document.body, observerOptions);
  }
}
