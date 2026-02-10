import { WebComponentManager, Hooks, mergeWebComponentsAttrs as onBeforeElUpdated } from "graphene/src";

(function () {
  const componentManager = new WebComponentManager();

  // Check if connect method exists before calling it
  if (typeof componentManager.connect === 'function') {
    componentManager.connect();
  } else {
    console.warn('WebComponentManager.connect() is not available');
  };

  (window as any).storybook = {
    Hooks,
    LiveSocketOptions: {
      dom: {
        onBeforeElUpdated
      }
    }
  };
  (window as any).componentManager = componentManager;
})();
