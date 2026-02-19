import {
  on
} from "./chunk-ML2VKJHQ.js";

// node_modules/@carbon/web-components/es/globals/mixins/host-listener.js
var EVENT_NAME_FORMAT = /^((document|window|parentRoot|shadowRoot):)?([\w-]+)$/;
var HostListenerMixin = (Base) => {
  class HostListenerMixinImpl extends Base {
    constructor() {
      super(...arguments);
      this._handles = /* @__PURE__ */ new Set();
    }
    connectedCallback() {
      super.connectedCallback();
      const hostListeners = this.constructor._hostListeners;
      Object.keys(hostListeners).forEach((listenerName) => {
        Object.keys(hostListeners[listenerName]).forEach((type) => {
          var _a;
          const tokens = EVENT_NAME_FORMAT.exec(type);
          if (!tokens) {
            throw new Error(`Could not parse the event name: ${listenerName}`);
          }
          const [, , targetName, unprefixedType] = tokens;
          const target = {
            document: this.ownerDocument,
            // eslint-disable-next-line @typescript-eslint/no-non-null-assertion -- https://github.com/carbon-design-system/carbon/issues/20452
            window: this.ownerDocument.defaultView,
            parentRoot: this.getRootNode(),
            shadowRoot: this.shadowRoot
          }[targetName] || this;
          const { options } = hostListeners[listenerName][type];
          this._handles.add(on(target, (_a = this.constructor[unprefixedType]) !== null && _a !== void 0 ? _a : unprefixedType, this[listenerName], options));
        });
      });
    }
    disconnectedCallback() {
      this._handles.forEach((handle) => {
        handle.release();
        this._handles.delete(handle);
      });
      super.disconnectedCallback();
    }
  }
  HostListenerMixinImpl._hostListeners = {};
  return HostListenerMixinImpl;
};

export {
  HostListenerMixin
};
