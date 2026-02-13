import { WebComponentManager, mergeWebComponentsAttrs as onBeforeElUpdated } from "graphene";
import { Hooks } from "./hooks";

(function () {
  const componentManager = new WebComponentManager();
  componentManager.connect();
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
