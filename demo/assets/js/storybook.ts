import * as Graphene from "/graphene/assets/index.js";
import { buildHooks } from "./hooks";

(function () {
  (window as any).Graphene = Graphene;
  const { WebComponentManager, mergeWebComponentsAttrs } = Graphene;
  const componentManager = new WebComponentManager();
  componentManager.connect();
  (window as any).storybook = {
    Hooks: buildHooks(),
    LiveSocketOptions: {
      dom: {
        onBeforeElUpdated: mergeWebComponentsAttrs
      }
    }
  };
  (window as any).componentManager = componentManager;
})();
