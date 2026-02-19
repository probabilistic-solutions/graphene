import{a as x}from"./chunk-KQ4ZLXFR.js";import"./chunk-4CAVJD2K.js";import"./chunk-3MHOEFB5.js";import"./chunk-3QM3NKSG.js";import"./chunk-LLDSBWCT.js";import"./chunk-Z4BITE3I.js";import"./chunk-GZYWVKTI.js";import"./chunk-OOALB5NU.js";import"./chunk-HGK3H7QL.js";import"./chunk-5KAQSVR4.js";import"./chunk-FNXXNWUE.js";import"./chunk-RSVHJO44.js";import{a as C}from"./chunk-MSGQGVB3.js";import{a as I}from"./chunk-A74FWP22.js";import"./chunk-MQVBUZX2.js";import{a as S}from"./chunk-SMKH7ZGP.js";import"./chunk-635XMAC7.js";import"./chunk-ZAY6VZZY.js";import"./chunk-BNSRTGFR.js";import"./chunk-IJO64LAV.js";import"./chunk-NB5AMTOW.js";import"./chunk-CM2AUCRV.js";import{b as d,c as _,d as m,f as E}from"./chunk-DPD5ZZAY.js";import{a as p,b as k}from"./chunk-S4Z7DAZ3.js";import{a as z}from"./chunk-5DYO2IB6.js";import{a as s,f as u,j as w}from"./chunk-TII5QPTS.js";import"./chunk-5FUAZXSB.js";var g;(function(h){h.EXTRA_SMALL="xs",h.SMALL="sm",h.MEDIUM="md",h.LARGE="lg",h.EXTRA_EXTRA_LARGE="2xl"})(g||(g={}));var y;(function(h){h.RIGHT="right",h.LEFT="left"})(y||(y={}));var N={elem:"svg",attrs:{xmlns:"http://www.w3.org/2000/svg",viewBox:"0 0 16 16",fill:"currentColor",width:16,height:16},content:[{elem:"path",attrs:{d:"M6.7 12.3 2.9 8.5 15 8.5 15 7.5 2.9 7.5 6.7 3.7 6 3 1 8 6 13z"}}],name:"arrow--left",size:16};var D="240ms";var R=Node.DOCUMENT_POSITION_PRECEDING|Node.DOCUMENT_POSITION_CONTAINS,U=Node.DOCUMENT_POSITION_FOLLOWING|Node.DOCUMENT_POSITION_CONTAINED_BY,r=`${p}--side-panel`,F=`${p}--action-set`,H=(h,t)=>t?(h.observe(t),{release(){return h.unobserve(t),null}}):null;function A(h,t){for(let e=h.length-1;e>=0;--e){let i=h[e];if(i.focus(),i.ownerDocument.activeElement===i)return!0}return!1}var n=class extends I(w){constructor(){super(...arguments),this._hObserveResize=null,this._launcher=null,this._doAnimateTitle=!0,this._isOpen=!1,this._containerScrollTop=-16,this._hasSubtitle=!1,this._hasSlug=!1,this._hasActionToolbar=!1,this._actionsCount=0,this._slugCloseSize="sm",this._handleBlur=async({target:t,relatedTarget:e})=>{var i;let{open:o,_startSentinelNode:a,_endSentinelNode:l}=this,c=t!==this&&this.contains(t),f=e!==this&&(this.contains(e)||((i=this.shadowRoot)===null||i===void 0?void 0:i.contains(e))&&e!==a&&e!==l),{selectorTabbable:$}=this.constructor;if(o&&e&&c&&!f){let b=t.compareDocumentPosition(e);e===a||b&R?(await this.constructor._delay(),!A(this.querySelectorAll($))&&e!==this&&this.focus()):(e===l||b&U)&&(await this.constructor._delay(),A(this.querySelectorAll($))||this.focus())}},this._handleKeydown=({key:t,target:e})=>{(t==="Esc"||t==="Escape")&&this._handleUserInitiatedClose(e)},this._reducedMotion=typeof window!="undefined"&&(window!=null&&window.matchMedia)?window.matchMedia("(prefers-reduced-motion: reduce)"):{matches:!0},this._adjustPageContent=()=>{var t,e;if(this.selectorPageContent){let i=document.querySelector(this.selectorPageContent);if(i){let o={marginInlineStart:"",marginInlineEnd:"",inlineSize:"",transition:this._reducedMotion.matches?"none":`all ${D}`,transitionProperty:"margin-inline-start, margin-inline-end"};this.open&&(o.inlineSize="auto",this.placement==="left"?o.marginInlineStart=`${(t=this===null||this===void 0?void 0:this._sidePanel)===null||t===void 0?void 0:t.offsetWidth}px`:o.marginInlineEnd=`${(e=this===null||this===void 0?void 0:this._sidePanel)===null||e===void 0?void 0:e.offsetWidth}px`),Object.keys(o).forEach(a=>{i.style[a]=o[a]})}}},this._checkSetOpen=()=>{let{_sidePanel:t}=this;t&&this._isOpen?this._reducedMotion?this._isOpen=!1:t.addEventListener("transitionend",()=>{this._isOpen=!1}):this._isOpen=this.open},this._checkUpdateIconButtonSizes=()=>{var t,e;let i=this.querySelector(`${p}-slug`),o=(t=this===null||this===void 0?void 0:this.shadowRoot)===null||t===void 0?void 0:t.querySelectorAll("#nav-back-button, #close-button"),a="sm";if(i||o!=null&&o.length){let l=(e=this===null||this===void 0?void 0:this.querySelectorAll)===null||e===void 0?void 0:e.call(this,`${p}-button[slot='actions']`);l!=null&&l.length&&/l/.test(this.size)&&(a="md")}i&&(i==null||i.setAttribute("size",a)),o&&[...o].forEach(l=>{l.setAttribute("size",a)})},this._checkUpdateActionSizes=()=>{if(this._actions)for(let t=0;t<this._actions.length;t++)this._actions[t].setAttribute("size",this.condensedActions?"lg":"xl")},this._maxActions=3,this._checkSetDoAnimateTitle=()=>{var t,e,i;let o=!1;if(this._sidePanel&&this.open&&this.animateTitle&&(!((t=this===null||this===void 0?void 0:this.title)===null||t===void 0)&&t.length)&&!this._reducedMotion.matches){let a=this._getScrollAnimationDistance();(i=(e=this===null||this===void 0?void 0:this._sidePanel)===null||e===void 0?void 0:e.style)===null||i===void 0||i.setProperty(`--${r}--scroll-animation-distance`,`${a}`);let l=this._animateScrollWrapper;if(!l&&this.animateTitle&&!this._doAnimateTitle&&(l=this._innerContent),l){let c=window==null?void 0:window.getComputedStyle(this._innerContent),f=c?parseFloat(c==null?void 0:c.paddingTop)+parseFloat(c==null?void 0:c.paddingBottom):0;o=(!!this.labelText||!!this._hasActionToolbar||this._hasSubtitle)&&l.scrollHeight-l.clientHeight>=a+f}}this._doAnimateTitle=o},this._resizeObserver=new ResizeObserver(()=>{this._sidePanel&&this._checkSetDoAnimateTitle()}),this._getScrollAnimationDistance=()=>{var t,e,i,o;let a=(e=(t=this===null||this===void 0?void 0:this._label)===null||t===void 0?void 0:t.offsetHeight)!==null&&e!==void 0?e:0,l=(o=(i=this===null||this===void 0?void 0:this._subtitle)===null||i===void 0?void 0:i.offsetHeight)!==null&&o!==void 0?o:0,c=this._hasActionToolbar?this._title.offsetHeight-this._title.clientHeight:0;return a+l+c},this._scrollObserver=()=>{var t,e,i,o;let a=(e=(t=this._animateScrollWrapper)===null||t===void 0?void 0:t.scrollTop)!==null&&e!==void 0?e:0,l=this._getScrollAnimationDistance();(o=(i=this===null||this===void 0?void 0:this._sidePanel)===null||i===void 0?void 0:i.style)===null||o===void 0||o.setProperty(`--${r}--scroll-animation-progress`,`${Math.min(a,l)/l}`)},this._handleCurrentStepUpdate=()=>{var t;let e=(t=this._animateScrollWrapper)!==null&&t!==void 0?t:this._innerContent;e&&(e.scrollTop=0)},this.animateTitle=!0,this.closeIconDescription="Close",this.condensedActions=!1,this.includeOverlay=!1,this.navigationBackIconDescription="Back",this.open=!1,this.placement=y.RIGHT,this.preventCloseOnClickOutside=!1,this.selectorPageContent="",this.size=g.MEDIUM,this.slideIn=!1}_handleClickOnOverlay(t){this.preventCloseOnClickOutside||this._handleUserInitiatedClose(t.target)}_handleCloseClick(t){this._handleUserInitiatedClose(t.target)}_handleUserInitiatedClose(t){if(this.open){let e={bubbles:!0,cancelable:!0,composed:!0,detail:{triggeredBy:t}};this.dispatchEvent(new CustomEvent(this.constructor.eventBeforeClose,e))&&(this.open=!1,this.dispatchEvent(new CustomEvent(this.constructor.eventClose,e)))}}_handleNavigateBack(t){this.dispatchEvent(new CustomEvent(this.constructor.eventNavigateBack,{composed:!0,detail:{triggeredBy:t}}))}_handleSlugChange(t){this._checkUpdateIconButtonSizes();let e=t.target.assignedElements();this._hasSlug=e.length>0}_handleSubtitleChange(t){let e=t.target,i=e==null?void 0:e.assignedElements();this._hasSubtitle=i.length>0}_handleActionToolbarChange(t){let e=t.target,i=e==null?void 0:e.assignedElements();if(this._hasActionToolbar=i&&i.length>0,this._hasActionToolbar)for(let o of i)o.setAttribute("size","sm")}_handleActionsChange(t){var e;let i=t.target,o=i==null?void 0:i.assignedElements();this._checkUpdateIconButtonSizes();let a=(e=o==null?void 0:o.length)!==null&&e!==void 0?e:0;a>this._maxActions?this._actionsCount=this._maxActions:this._actionsCount=a;for(let l=0;l<(o==null?void 0:o.length);l++)l+1>this._maxActions?(o[l].setAttribute("hidden","true"),o[l].setAttribute(`data-actions-limit-${this._maxActions}-exceeded`,`${o.length}`)):o[l].classList.add(`${F}__action-button`);this._checkUpdateActionSizes()}async connectObservers(){await this.updateComplete,this._hObserveResize=H(this._resizeObserver,this._sidePanel)}disconnectObservers(){this._hObserveResize&&(this._hObserveResize=this._hObserveResize.release())}connectedCallback(){super.connectedCallback(),this.disconnectObservers(),this.connectObservers()}disconnectedCallback(){super.disconnectedCallback(),this.disconnectObservers()}render(){let{closeIconDescription:t,condensedActions:e,currentStep:i,includeOverlay:o,labelText:a,navigationBackIconDescription:l,open:c,placement:f,size:$,slideIn:b,title:v}=this;if(!c&&!this._isOpen)return u``;let B=["","single","double","triple"][this._actionsCount],P=u`<div
      class=${`${r}__title`}
      ?no-label=${!!a}>
      <h2 class=${v?`${r}__title-text`:""} title=${v}>
        ${v}
      </h2>

      ${this._doAnimateTitle?u`<h2
            class=${`${r}__collapsed-title-text`}
            title=${v}
            aria-hidden="true">
            ${v}
          </h2>`:""}
    </div>`,M=this.title?` ${r}__header--has-title `:"",O=u`
      <div
        class=${`${r}__header${M}`}
        ?detail-step=${i>0}
        ?no-title-animation=${!this._doAnimateTitle}
        ?reduced-motion=${this._reducedMotion.matches}>
        <!-- render back button -->
        ${i>0?u`<cds-icon-button
              align="bottom-left"
              aria-label=${l}
              kind="ghost"
              size="sm"
              class=${`${p}--btn ${r}__navigation-back-button`}
              @click=${this._handleNavigateBack}>
              ${S(N,{slot:"icon"})}
              <span slot="tooltip-content">
                ${l}
              </span>
            </cds-icon-button>`:""}

        <!-- render title label -->
        ${v!=null&&v.length&&(a!=null&&a.length)?u` <p class=${`${r}__label-text`}>${a}</p>`:""}

        <!-- title -->
        ${v?P:""}

        <!-- render slug and close button area -->
        <div class=${`${r}__slug-and-close`}>
          <slot name="slug" @slotchange=${this._handleSlugChange}></slot>
          <!-- {normalizedSlug} -->
          <cds-icon-button
            align="bottom-right"
            aria-label=${t}
            kind="ghost"
            size="sm"
            class=${`${r}__close-button`}
            @click=${this._handleCloseClick}>
            ${S(x,{slot:"icon"})}
            <span slot="tooltip-content"> ${t} </span>
          </cds-icon-button>
        </div>

        <!-- render sub title -->
        <p
          class=${this._hasSubtitle?`${r}__subtitle-text`:""}
          ?hidden=${!this._hasSubtitle}
          ?no-title-animation=${!this._doAnimateTitle}
          ?no-action-toolbar=${!this._hasActionToolbar}
          ?no-title=${!v}>
          <slot
            name="subtitle"
            @slotchange=${this._handleSubtitleChange}></slot>
        </p>

        <div
          class=${this._hasActionToolbar?`${r}__action-toolbar`:""}
          ?hidden=${!this._hasActionToolbar}
          ?no-title-animation=${!this._doAnimateTitle}>
          <slot
            name="action-toolbar"
            @slotchange=${this._handleActionToolbarChange}></slot>
        </div>
      </div>
    `,T=u`<div
      class=${`${r}__inner-content`}
      ?scrolls=${!this._doAnimateTitle}>
      <cds-layer level="1">
        <slot></slot>
      </cds-layer>
    </div> `,L=this._doAnimateTitle?` ${r}--animated-title`:"";return u`
      <div
        class=${`${r}${L}`}
        part="dialog"
        role="complementary"
        placement="${f}"
        ?has-slug=${this._hasSlug}
        ?open=${this._isOpen}
        ?opening=${c&&!this._isOpen}
        ?closing=${!c&&this._isOpen}
        ?condensed-actions=${e}
        ?overlay=${o||b}
        ?slide-in=${b}
        size=${$}>
        <a
          id="start-sentinel"
          class="sentinel"
          hidden
          href="javascript:void 0"
          role="navigation"></a>

        ${this._doAnimateTitle?u`<div class=${`${r}__animated-scroll-wrapper`} scrolls>
              ${O} ${T}
            </div>`:u` ${O} ${T}`}

        <cds-button-set-base
          class=${`${r}__actions-container`}
          ?hidden=${this._actionsCount===0}
          ?condensed=${e}
          actions-multiple=${B}
          size=${$}>
          <slot name="actions" @slotchange=${this._handleActionsChange}></slot>
        </cds-button-set-base>

        <a
          id="end-sentinel"
          class="sentinel"
          hidden
          href="javascript:void 0"
          role="navigation"></a>
      </div>

      ${o?u`<div
            ?slide-in=${b}
            class=${`${r}__overlay`}
            ?open=${this.open}
            ?opening=${c&&!this._isOpen}
            ?closing=${!c&&this._isOpen}
            tabindex="-1"
            @click=${this._handleClickOnOverlay}></div>`:""}
    `}async updated(t){var e,i,o,a;if(t.has("condensedActions")&&this._checkUpdateActionSizes(),t.has("currentStep")&&this._handleCurrentStepUpdate(),t.has("_doAnimateTitle")&&((e=this===null||this===void 0?void 0:this._animateScrollWrapper)===null||e===void 0||e.removeEventListener("scroll",this._scrollObserver),this._doAnimateTitle?(i=this===null||this===void 0?void 0:this._animateScrollWrapper)===null||i===void 0||i.addEventListener("scroll",this._scrollObserver):(a=(o=this===null||this===void 0?void 0:this._sidePanel)===null||o===void 0?void 0:o.style)===null||a===void 0||a.setProperty(`--${r}--scroll-animation-progress`,"0")),(t.has("_isOpen")||t.has("animateTitle"))&&this._checkSetDoAnimateTitle(),(t.has("slideIn")||t.has("open")||t.has("includeOverlay"))&&this._adjustPageContent(),t.has("open"))if(this._checkSetOpen(),this.disconnectObservers(),this.open){this.connectObservers(),this._launcher=this.ownerDocument.activeElement;let l=this.selectorInitialFocus&&this.querySelector(this.selectorInitialFocus);await this.constructor._delay(),l?l.focus():A(this.querySelectorAll(this.constructor.selectorTabbable))||this.focus()}else this._launcher&&typeof this._launcher.focus=="function"&&(this._launcher.focus(),this._launcher=null)}static _delay(t=0){return new Promise(e=>{setTimeout(e,t)})}static get selectorTabbable(){return k}static get eventBeforeClose(){return`${p}-side-panel-beingclosed`}static get eventClose(){return`${p}-side-panel-closed`}static get eventNavigateBack(){return`${p}-side-panel-navigate-back`}};s([m("#start-sentinel")],n.prototype,"_startSentinelNode",void 0);s([m("#end-sentinel")],n.prototype,"_endSentinelNode",void 0);s([m(`.${r}`)],n.prototype,"_sidePanel",void 0);s([m(`.${r}__animated-scroll-wrapper`)],n.prototype,"_animateScrollWrapper",void 0);s([m(`.${r}__label-text`)],n.prototype,"_label",void 0);s([m(`.${r}__title-text`)],n.prototype,"_title",void 0);s([m(`.${r}__subtitle-text`)],n.prototype,"_subtitle",void 0);s([m(`.${r}__inner-content`)],n.prototype,"_innerContent",void 0);s([E({slot:"actions",selector:`${p}-button`})],n.prototype,"_actions",void 0);s([_()],n.prototype,"_doAnimateTitle",void 0);s([_()],n.prototype,"_isOpen",void 0);s([_()],n.prototype,"_containerScrollTop",void 0);s([_()],n.prototype,"_hasSubtitle",void 0);s([_()],n.prototype,"_hasSlug",void 0);s([_()],n.prototype,"_hasActionToolbar",void 0);s([_()],n.prototype,"_actionsCount",void 0);s([_()],n.prototype,"_slugCloseSize",void 0);s([C("shadowRoot:focusout")],n.prototype,"_handleBlur",void 0);s([C("document:keydown")],n.prototype,"_handleKeydown",void 0);s([d({reflect:!0,attribute:"animate-title",type:Boolean})],n.prototype,"animateTitle",void 0);s([d({reflect:!0,attribute:"close-icon-description"})],n.prototype,"closeIconDescription",void 0);s([d({type:Boolean,reflect:!0,attribute:"condensed-actions"})],n.prototype,"condensedActions",void 0);s([d({reflect:!0,attribute:"current-step",type:Number})],n.prototype,"currentStep",void 0);s([d({attribute:"include-overlay",type:Boolean,reflect:!0})],n.prototype,"includeOverlay",void 0);s([d({reflect:!0,attribute:"label-text"})],n.prototype,"labelText",void 0);s([d({reflect:!0,attribute:"navigation-back-icon-description"})],n.prototype,"navigationBackIconDescription",void 0);s([d({type:Boolean,reflect:!0})],n.prototype,"open",void 0);s([d({reflect:!0,type:String})],n.prototype,"placement",void 0);s([d({type:Boolean,attribute:"prevent-close-on-click-outside"})],n.prototype,"preventCloseOnClickOutside",void 0);s([d({reflect:!0,attribute:"selector-initial-focus",type:String})],n.prototype,"selectorInitialFocus",void 0);s([d({reflect:!0,attribute:"selector-page-content"})],n.prototype,"selectorPageContent",void 0);s([d({reflect:!0,type:String})],n.prototype,"size",void 0);s([d({attribute:"slide-in",type:Boolean,reflect:!0})],n.prototype,"slideIn",void 0);s([d({reflect:!1,type:String})],n.prototype,"title",void 0);n=s([z(`${p}-side-panel`)],n);
