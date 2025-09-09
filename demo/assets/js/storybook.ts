// import { mergeWebComponentsAttrs as onBeforeElUpdated } from "./demo/socket_utils";
import { WebComponentsManager, Hooks, mergeWebComponentsAttrs as onBeforeElUpdated } from "graphene/src";

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
  }
  (window as any).componentManager = componentManager
})()
