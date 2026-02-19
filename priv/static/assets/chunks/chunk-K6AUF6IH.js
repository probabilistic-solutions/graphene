import{a as v,b as f}from"./chunk-5FUAZXSB.js";var a=class extends Event{constructor(t,o,i,s){super("context-request",{bubbles:!0,composed:!0}),this.context=t,this.contextTarget=o,this.callback=i,this.subscribe=s!=null?s:!1}};var l=class{get value(){return this.o}set value(t){this.setValue(t)}setValue(t,o=!1){let i=o||!Object.is(t,this.o);this.o=t,i&&this.updateObservers()}constructor(t){this.subscriptions=new Map,this.updateObservers=()=>{for(let[o,{disposer:i}]of this.subscriptions)o(this.o,i)},t!==void 0&&(this.value=t)}addCallback(t,o,i){if(!i)return void t(this.value);this.subscriptions.has(t)||this.subscriptions.set(t,{disposer:()=>{this.subscriptions.delete(t)},consumerHost:o});let{disposer:s}=this.subscriptions.get(t);t(this.value,s)}clearCallbacks(){this.subscriptions.clear()}};var b=class extends Event{constructor(t,o){super("context-provider",{bubbles:!0,composed:!0}),this.context=t,this.contextTarget=o}},h=class extends l{constructor(t,o,i){var s,r;super(o.context!==void 0?o.initialValue:i),this.onContextRequest=e=>{var d;if(e.context!==this.context)return;let n=(d=e.contextTarget)!=null?d:e.composedPath()[0];n!==this.host&&(e.stopPropagation(),this.addCallback(e.callback,n,e.subscribe))},this.onProviderRequest=e=>{var d;if(e.context!==this.context||((d=e.contextTarget)!=null?d:e.composedPath()[0])===this.host)return;let n=new Set;for(let[x,{consumerHost:p}]of this.subscriptions)n.has(x)||(n.add(x),p.dispatchEvent(new a(this.context,p,x,!0)));e.stopPropagation()},this.host=t,o.context!==void 0?this.context=o.context:this.context=o,this.attachListeners(),(r=(s=this.host).addController)==null||r.call(s,this)}attachListeners(){this.host.addEventListener("context-request",this.onContextRequest),this.host.addEventListener("context-provider",this.onProviderRequest)}hostConnected(){this.host.dispatchEvent(new b(this.context,this.host))}};function C({context:c}){return(t,o)=>{let i=new WeakMap;if(typeof o=="object")return{get(){return t.get.call(this)},set(s){return i.get(this).setValue(s),t.set.call(this,s)},init(s){return i.set(this,new h(this,{context:c,initialValue:s})),s}};{t.constructor.addInitializer(e=>{i.set(e,new h(e,{context:c}))});let s=Object.getOwnPropertyDescriptor(t,o),r;if(s===void 0){let e=new WeakMap;r={get(){return e.get(this)},set(n){i.get(this).setValue(n),e.set(this,n)},configurable:!0,enumerable:!0}}else{let e=s.set;r=f(v({},s),{set(n){i.get(this).setValue(n),e==null||e.call(this,n)}})}return void Object.defineProperty(t,o,r)}}}var u=class{constructor(t,o,i,s){var r;if(this.subscribe=!1,this.provided=!1,this.value=void 0,this.t=(e,n)=>{this.unsubscribe&&(this.unsubscribe!==n&&(this.provided=!1,this.unsubscribe()),this.subscribe||this.unsubscribe()),this.value=e,this.host.requestUpdate(),this.provided&&!this.subscribe||(this.provided=!0,this.callback&&this.callback(e,n)),this.unsubscribe=n},this.host=t,o.context!==void 0){let e=o;this.context=e.context,this.callback=e.callback,this.subscribe=(r=e.subscribe)!=null?r:!1}else this.context=o,this.callback=i,this.subscribe=s!=null?s:!1;this.host.addController(this)}hostConnected(){this.dispatchRequest()}hostDisconnected(){this.unsubscribe&&(this.unsubscribe(),this.unsubscribe=void 0)}dispatchRequest(){this.host.dispatchEvent(new a(this.context,this.host,this.t,this.subscribe))}};function m({context:c,subscribe:t}){return(o,i)=>{typeof i=="object"?i.addInitializer(function(){new u(this,{context:c,callback:s=>{o.set.call(this,s)},subscribe:t})}):o.constructor.addInitializer(s=>{new u(s,{context:c,callback:r=>{s[i]=r},subscribe:t})})}}export{C as a,m as b};
/*! Bundled license information:

@lit/context/lib/context-request-event.js:
  (**
   * @license
   * Copyright 2021 Google LLC
   * SPDX-License-Identifier: BSD-3-Clause
   *)

@lit/context/lib/value-notifier.js:
  (**
   * @license
   * Copyright 2021 Google LLC
   * SPDX-License-Identifier: BSD-3-Clause
   *)

@lit/context/lib/controllers/context-provider.js:
  (**
   * @license
   * Copyright 2021 Google LLC
   * SPDX-License-Identifier: BSD-3-Clause
   *)

@lit/context/lib/decorators/provide.js:
  (**
   * @license
   * Copyright 2017 Google LLC
   * SPDX-License-Identifier: BSD-3-Clause
   *)

@lit/context/lib/controllers/context-consumer.js:
  (**
   * @license
   * Copyright 2021 Google LLC
   * SPDX-License-Identifier: BSD-3-Clause
   *)

@lit/context/lib/decorators/consume.js:
  (**
   * @license
   * Copyright 2022 Google LLC
   * SPDX-License-Identifier: BSD-3-Clause
   *)

@lit/context/lib/create-context.js:
  (**
   * @license
   * Copyright 2021 Google LLC
   * SPDX-License-Identifier: BSD-3-Clause
   *)

@lit/context/lib/context-root.js:
  (**
   * @license
   * Copyright 2021 Google LLC
   * SPDX-License-Identifier: BSD-3-Clause
   *)
*/
