import {
  on
} from "./chunk-ML2VKJHQ.js";

// node_modules/@carbon/web-components/es/globals/mixins/form.js
var FormMixin = (Base) => {
  class FormMixinImpl extends Base {
    constructor() {
      super(...arguments);
      this._hFormdata = null;
    }
    connectedCallback() {
      super.connectedCallback();
      const form = this.closest("form");
      if (form) {
        this._hFormdata = on(form, "formdata", this._handleFormdata.bind(this));
      }
    }
    disconnectedCallback() {
      if (this._hFormdata) {
        this._hFormdata = this._hFormdata.release();
      }
      super.disconnectedCallback();
    }
  }
  return FormMixinImpl;
};

export {
  FormMixin
};
