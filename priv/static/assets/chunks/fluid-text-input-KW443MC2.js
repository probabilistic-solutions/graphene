import {
  styles
} from "./chunk-LMVHFIAJ.js";
import "./chunk-A3QAVRUP.js";
import {
  CDSTextInput$1
} from "./chunk-AXQ75YOL.js";
import "./chunk-MZX7RJLY.js";
import "./chunk-MCK3EHK6.js";
import "./chunk-MNFEJBUN.js";
import "./chunk-BVJDLJUP.js";
import "./chunk-357XJSHN.js";
import "./chunk-KDBKJKDV.js";
import "./chunk-ML2VKJHQ.js";
import "./chunk-O3BBZPBQ.js";
import "./chunk-AMZPNZ4R.js";
import "./chunk-OQ4J3C2F.js";
import "./chunk-QKM5NJVJ.js";
import "./chunk-MGAE3NM5.js";
import "./chunk-M2VBID3H.js";
import "./chunk-X7XRQHU6.js";
import {
  prefix
} from "./chunk-ITCMO2MJ.js";
import {
  carbonElement
} from "./chunk-D5HOJOMG.js";
import {
  __decorate,
  b
} from "./chunk-K245USOM.js";
import "./chunk-G6EI4S4W.js";

// node_modules/@carbon/web-components/es/components/fluid-text-input/fluid-text-input.js
var CDSFluidTextInput = class CDSFluidTextInput2 extends CDSTextInput$1 {
  connectedCallback() {
    this.setAttribute("isFluid", "true");
    super.connectedCallback();
  }
  updated() {
    var _a;
    const formItem = (_a = this.shadowRoot) === null || _a === void 0 ? void 0 : _a.querySelector(`.${prefix}--form-item`);
    if (formItem) {
      formItem.classList.add(`${prefix}--text-input--fluid`);
    }
  }
  render() {
    return b` ${super.render()} `;
  }
};
CDSFluidTextInput.styles = [CDSTextInput$1.styles, styles];
CDSFluidTextInput = __decorate([
  carbonElement(`${prefix}-fluid-text-input`)
], CDSFluidTextInput);
