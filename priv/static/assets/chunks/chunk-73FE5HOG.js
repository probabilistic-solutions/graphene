import {
  selectorTabbable
} from "./chunk-ITCMO2MJ.js";

// node_modules/@carbon/web-components/es/globals/mixins/focus.js
var FocusMixin = (Base) => class extends Base {
  /**
   * Focuses on the first focusable element in the shadow DOM.
   */
  focus() {
    if (this.shadowRoot.delegatesFocus) {
      super.focus();
    } else {
      const delegateTarget = (
        // eslint-disable-next-line @typescript-eslint/no-non-null-assertion -- https://github.com/carbon-design-system/carbon/issues/20452
        this.shadowRoot.querySelector(selectorTabbable) || this.querySelector(selectorTabbable)
      );
      if (delegateTarget) {
        delegateTarget.focus();
      } else {
        super.focus();
      }
    }
  }
};

export {
  FocusMixin
};
