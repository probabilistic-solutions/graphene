import{d as f,e as h}from"./chunk-TII5QPTS.js";import{a as d,b as m}from"./chunk-5FUAZXSB.js";var x={attribute:!0,type:String,converter:f,reflect:!1,hasChanged:h},b=(t=x,r,e)=>{let{kind:n,metadata:c}=e,i=globalThis.litPropertyMetadata.get(c);if(i===void 0&&globalThis.litPropertyMetadata.set(c,i=new Map),n==="setter"&&((t=Object.create(t)).wrapped=!0),i.set(e.name,t),n==="accessor"){let{name:a}=e;return{set(s){let o=r.get.call(this);r.set.call(this,s),this.requestUpdate(a,o,t,!0,s)},init(s){return s!==void 0&&this.C(a,void 0,t,s),s}}}if(n==="setter"){let{name:a}=e;return function(s){let o=this[a];r.call(this,s),this.requestUpdate(a,o,t,!0,s)}}throw Error("Unsupported decorator location: "+n)};function y(t){return(r,e)=>typeof e=="object"?b(t,r,e):((n,c,i)=>{let a=c.hasOwnProperty(i);return c.constructor.createProperty(i,n),a?Object.getOwnPropertyDescriptor(c,i):void 0})(t,r,e)}var j=t=>(r,e)=>{e!==void 0?e.addInitializer(()=>{customElements.define(t,r)}):customElements.define(t,r)};function P(t){return y(m(d({},t),{state:!0,attribute:!1}))}var u=(t,r,e)=>(e.configurable=!0,e.enumerable=!0,Reflect.decorate&&typeof r!="object"&&Object.defineProperty(t,r,e),e);function U(t,r){return(e,n,c)=>{let i=a=>{var s,o;return(o=(s=a.renderRoot)==null?void 0:s.querySelector(t))!=null?o:null};if(r){let{get:a,set:s}=typeof n=="object"?e:c!=null?c:(()=>{let o=Symbol();return{get(){return this[o]},set(l){this[o]=l}}})();return u(e,n,{get(){let o=a.call(this);return o===void 0&&(o=i(this),(o!==null||this.hasUpdated)&&s.call(this,o)),o}})}return u(e,n,{get(){return i(this)}})}}var p;function N(t){return(r,e)=>u(r,e,{get(){var n;return((n=this.renderRoot)!=null?n:p!=null?p:p=document.createDocumentFragment()).querySelectorAll(t)}})}function F(t){return(r,e)=>{let{slot:n,selector:c}=t!=null?t:{},i="slot"+(n?`[name=${n}]`:":not([name])");return u(r,e,{get(){var o,l;let a=(o=this.renderRoot)==null?void 0:o.querySelector(i),s=(l=a==null?void 0:a.assignedElements(t))!=null?l:[];return c===void 0?s:s.filter(g=>g.matches(c))}})}}export{j as a,y as b,P as c,U as d,N as e,F as f};
/*! Bundled license information:

@lit/reactive-element/decorators/property.js:
  (**
   * @license
   * Copyright 2017 Google LLC
   * SPDX-License-Identifier: BSD-3-Clause
   *)

@lit/reactive-element/decorators/custom-element.js:
  (**
   * @license
   * Copyright 2017 Google LLC
   * SPDX-License-Identifier: BSD-3-Clause
   *)

@lit/reactive-element/decorators/state.js:
  (**
   * @license
   * Copyright 2017 Google LLC
   * SPDX-License-Identifier: BSD-3-Clause
   *)

@lit/reactive-element/decorators/event-options.js:
  (**
   * @license
   * Copyright 2017 Google LLC
   * SPDX-License-Identifier: BSD-3-Clause
   *)

@lit/reactive-element/decorators/base.js:
  (**
   * @license
   * Copyright 2017 Google LLC
   * SPDX-License-Identifier: BSD-3-Clause
   *)

@lit/reactive-element/decorators/query.js:
  (**
   * @license
   * Copyright 2017 Google LLC
   * SPDX-License-Identifier: BSD-3-Clause
   *)

@lit/reactive-element/decorators/query-all.js:
  (**
   * @license
   * Copyright 2017 Google LLC
   * SPDX-License-Identifier: BSD-3-Clause
   *)

@lit/reactive-element/decorators/query-async.js:
  (**
   * @license
   * Copyright 2017 Google LLC
   * SPDX-License-Identifier: BSD-3-Clause
   *)

@lit/reactive-element/decorators/query-assigned-elements.js:
  (**
   * @license
   * Copyright 2021 Google LLC
   * SPDX-License-Identifier: BSD-3-Clause
   *)

@lit/reactive-element/decorators/query-assigned-nodes.js:
  (**
   * @license
   * Copyright 2017 Google LLC
   * SPDX-License-Identifier: BSD-3-Clause
   *)
*/
