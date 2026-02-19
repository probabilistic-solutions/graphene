import {
  DROPDOWN_SIZE,
  styles
} from "./chunk-R4YRWDEG.js";
import "./chunk-XKCQS753.js";
import "./chunk-MCK3EHK6.js";
import "./chunk-MNFEJBUN.js";
import "./chunk-BVJDLJUP.js";
import "./chunk-357XJSHN.js";
import "./chunk-MZGBQGXZ.js";
import "./chunk-KDBKJKDV.js";
import "./chunk-3QPROXNA.js";
import "./chunk-IGHLRMAE.js";
import "./chunk-5HWAKYGL.js";
import "./chunk-TGGEFEEZ.js";
import "./chunk-ML2VKJHQ.js";
import "./chunk-O3BBZPBQ.js";
import "./chunk-AMZPNZ4R.js";
import "./chunk-OQ4J3C2F.js";
import "./chunk-QKM5NJVJ.js";
import "./chunk-73FE5HOG.js";
import {
  e
} from "./chunk-MGAE3NM5.js";
import "./chunk-M2VBID3H.js";
import {
  n
} from "./chunk-X7XRQHU6.js";
import {
  prefix
} from "./chunk-ITCMO2MJ.js";
import {
  carbonElement
} from "./chunk-D5HOJOMG.js";
import {
  __decorate,
  b,
  i2 as i
} from "./chunk-K245USOM.js";
import "./chunk-G6EI4S4W.js";

// node_modules/@carbon/web-components/es/components/dropdown/dropdown-skeleton.js
var CDSDropdownSkeleton = class CDSDropdownSkeleton2 extends i {
  constructor() {
    super(...arguments);
    this.hideLabel = false;
    this.size = DROPDOWN_SIZE.MEDIUM;
  }
  render() {
    const { hideLabel, size } = this;
    const classes = e({
      [`${prefix}--skeleton`]: true,
      [`${prefix}--dropdown`]: true,
      [`${prefix}--list-box--${size}`]: Boolean(size)
    });
    return b`
      ${!hideLabel ? b`<span class="${prefix}--label ${prefix}--skeleton"></span>` : null}
      <div class=${classes}></div>
    `;
  }
};
CDSDropdownSkeleton.styles = styles;
__decorate([
  n({ type: Boolean, reflect: true, attribute: "hide-label" })
], CDSDropdownSkeleton.prototype, "hideLabel", void 0);
__decorate([
  n({ reflect: true })
], CDSDropdownSkeleton.prototype, "size", void 0);
CDSDropdownSkeleton = __decorate([
  carbonElement(`${prefix}-dropdown-skeleton`)
], CDSDropdownSkeleton);
