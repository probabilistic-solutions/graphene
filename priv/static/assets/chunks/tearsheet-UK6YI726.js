import"./chunk-QM4EUWLS.js";import"./chunk-KQ4ZLXFR.js";import"./chunk-2X4H42FN.js";import"./chunk-TI6B2LBM.js";import"./chunk-4CAVJD2K.js";import"./chunk-TQZFQQME.js";import"./chunk-J3GUKJRU.js";import"./chunk-3MHOEFB5.js";import"./chunk-3QM3NKSG.js";import"./chunk-LLDSBWCT.js";import"./chunk-Z4BITE3I.js";import"./chunk-GZYWVKTI.js";import"./chunk-OOALB5NU.js";import"./chunk-HGK3H7QL.js";import"./chunk-5KAQSVR4.js";import"./chunk-FNXXNWUE.js";import"./chunk-RSVHJO44.js";import{a as k}from"./chunk-MSGQGVB3.js";import{a as N}from"./chunk-A74FWP22.js";import"./chunk-MQVBUZX2.js";import"./chunk-SMKH7ZGP.js";import"./chunk-635XMAC7.js";import"./chunk-ZAY6VZZY.js";import"./chunk-BNSRTGFR.js";import"./chunk-IJO64LAV.js";import"./chunk-NB5AMTOW.js";import"./chunk-CM2AUCRV.js";import{b as u,c as r,d as b,f as I}from"./chunk-DPD5ZZAY.js";import{a as c,b as O}from"./chunk-S4Z7DAZ3.js";import{a as A}from"./chunk-5DYO2IB6.js";import{a as i,f as p,j as w}from"./chunk-TII5QPTS.js";import"./chunk-5FUAZXSB.js";var $;(function(_){_.RIGHT="right",_.LEFT="left"})($||($={}));var C;(function(_){_.NARROW="narrow",_.WIDE="wide"})(C||(C={}));var f;(function(_){_.NARROW="narrow",_.WIDE="wide"})(f||(f={}));var d,T=3,H=Node.DOCUMENT_POSITION_PRECEDING|Node.DOCUMENT_POSITION_CONTAINS,D=Node.DOCUMENT_POSITION_FOLLOWING|Node.DOCUMENT_POSITION_CONTAINED_BY,a=`${c}--tearsheet`,E=`${c}--modal-header`,R=`${c}--action-set`;function S(_,t){for(let e=_.length-1;e>=0;--e){let n=_[e];if(n.focus(),n.ownerDocument.activeElement===n)return!0}return!1}var s=d=class extends N(w){constructor(){super(...arguments),this._launcher=null,this._actionsCount=0,this._hasHeaderActions=!1,this._hasLabel=!1,this._hasSlug=!1,this._hasTitle=!1,this._hasDescription=!1,this._hasInfluencerLeft=!1,this._hasInfluencerRight=!1,this._isOpen=!1,this._hasHeaderNavigation=!1,this._handleClick=t=>{t.composedPath().indexOf(this.shadowRoot)<0&&!this.preventCloseOnClickOutside&&this._handleUserInitiatedClose(t.target)},this._handleBlur=async({target:t,relatedTarget:e})=>{var n;if(!this._topOfStack())return;let{open:o,_startSentinelNode:l,_endSentinelNode:h}=this,v=t!==this&&this.contains(t),m=e!==this&&(this.contains(e)||((n=this.shadowRoot)===null||n===void 0?void 0:n.contains(e))&&e!==l&&e!==h),{selectorTabbable:g}=this.constructor;if(o&&e&&v&&!m){let y=t.compareDocumentPosition(e);e===l||y&H?(await this.constructor._delay(),!S(this.querySelectorAll(g))&&e!==this&&this.focus()):(e===h||y&D)&&(await this.constructor._delay(),S(this.querySelectorAll(g))||this.focus())}},this._handleKeydown=({key:t,target:e})=>{(t==="Esc"||t==="Escape")&&this._topOfStack()&&this._handleUserInitiatedClose(e)},this.ariaLabel="",this.closeIconDescription="Close",this.hasCloseIcon=!1,this.influencerPlacement=$.RIGHT,this.influencerWidth=C.NARROW,this.open=!1,this.preventCloseOnClickOutside=!1,this.width=f.NARROW,this._checkUpdateActionSizes=()=>{if(this._actions)for(let t=0;t<this._actions.length;t++)this._actions[t].setAttribute("size",this.width==="wide"?"2xl":"xl")},this._maxActions=4,this._stackDepth=-1,this._stackPosition=-1,this._topOfStack=()=>this._stackDepth===this._stackPosition,this._notifyStack=()=>{d._stack.all.forEach(t=>{t(Math.min(d._stack.open.length,T),d._stack.open.indexOf(t)+1)})},this._handleStackChange=(t,e)=>{this._stackDepth=t,this._stackPosition=e,this._stackDepth>1&&this._stackPosition>0?(this.setAttribute("stack-position",`${e}`),this.setAttribute("stack-depth",`${this._stackDepth}`)):(this.removeAttribute("stack-position"),this.removeAttribute("stack-depth"))},this._updateStack=()=>{if(this.open)d._stack.open.push(this._handleStackChange);else{let t=d._stack.open.indexOf(this._handleStackChange);t>=0&&d._stack.open.splice(t,1)}this._notifyStack()},this.actionsMultiple=["","single","double","triple"][this._actionsCount],this._checkSetOpen=()=>{let{_tearsheet:t}=this;t&&this._isOpen?t.addEventListener("transitionend",()=>{this._isOpen=!1}):window.requestAnimationFrame(()=>{this._isOpen=this.open})}}_checkSetHasSlot(t){var e,n;let o=t.target,l=o.getAttribute("data-postfix"),h=l?`-${l}`:"",v=`_has-${o.name}${h}`.replace(/-./g,m=>m[1].toUpperCase());this[v]=((n=(e=o==null?void 0:o.assignedElements())===null||e===void 0?void 0:e.length)!==null&&n!==void 0?n:0)>0}_handleClickContainer(t){t.target.matches(this.constructor.selectorCloseButton)&&this._handleUserInitiatedClose(t.target)}_handleUserInitiatedClose(t){if(this.open){let e={bubbles:!0,cancelable:!0,composed:!0,detail:{triggeredBy:t}};this.dispatchEvent(new CustomEvent(this.constructor.eventBeforeClose,e))&&(this.open=!1,this.dispatchEvent(new CustomEvent(this.constructor.eventClose,e)))}}_handleSlugChange(t){let e=t.target.assignedElements();this._hasSlug=e.length>0,this._hasSlug?(e[0].setAttribute("size","lg"),this.setAttribute("slug","")):this.removeAttribute("slug")}_handleActionsChange(t){var e;let n=t.target,o=n==null?void 0:n.assignedElements(),l=(e=o==null?void 0:o.length)!==null&&e!==void 0?e:0;l>this._maxActions?(this._actionsCount=this._maxActions,console.error(`Too many tearsheet actions, max ${this._maxActions}.`)):this._actionsCount=l;for(let h=0;h<(o==null?void 0:o.length);h++)h+1>this._maxActions?(o[h].setAttribute("hidden","true"),o[h].setAttribute(`data-actions-limit-${this._maxActions}-exceeded`,`${o.length}`)):o[h].classList.add(`${R}__action-button`);this._checkUpdateActionSizes()}connectedCallback(){super.connectedCallback(),d._stack.all.push(this._handleStackChange)}disconnectedCallback(){super.disconnectedCallback();let t=d._stack.all.indexOf(this._handleStackChange);d._stack.all.splice(t,1);let e=d._stack.all.indexOf(this._handleStackChange);d._stack.open.splice(e,1)}render(){let{closeIconDescription:t,influencerPlacement:e,influencerWidth:n,open:o,width:l}=this,h=["","single","double","triple"][this._actionsCount],v=p`<div
      class=${`${a}__header-fields`}>
      <h2 class=${`${E}__label`} ?hidden=${!this._hasLabel}>
        <slot name="label" @slotchange=${this._checkSetHasSlot}></slot>
      </h2>
      <h3
        class=${`${E}__heading ${a}__heading`}
        ?hidden=${!this._hasTitle}>
        <slot name="title" @slotchange=${this._checkSetHasSlot}></slot>
      </h3>
      <div
        class=${`${a}__header-description`}
        ?hidden=${!this._hasDescription}>
        <slot name="description" @slotchange=${this._checkSetHasSlot}></slot>
      </div>
    </div>`,m=p` <div
      class=${`${a}__header-actions`}
      ?hidden=${!this._hasHeaderActions||this.width==="narrow"}>
      <slot name="header-actions" @slotchange=${this._checkSetHasSlot}></slot>
    </div>`,g=p` <cds-modal-header
      class=${`${a}__header`}
      ?has-close-icon=${this.hasCloseIcon||(this===null||this===void 0?void 0:this._actionsCount)===0}
      ?has-navigation=${this._hasHeaderNavigation&&this.width==="wide"}
      ?has-header-actions=${this._hasHeaderActions&&this.width==="wide"}
      ?has-actions=${(this===null||this===void 0?void 0:this._actionsCount)>0}
      ?has-slug=${this===null||this===void 0?void 0:this._hasSlug}
      width=${l}>
      ${this.width===f.WIDE?p`<cds-layer level="1" class=${`${a}__header-content`}
            >${v}${m}</cds-layer
          >`:p`<div>${v}${m}</div>`}

      <div
        class=${`${a}__header-navigation`}
        ?hidden=${!this._hasHeaderNavigation||this.width==="narrow"}>
        <slot
          name="header-navigation"
          @slotchange=${this._checkSetHasSlot}></slot>
      </div>
      <slot name="slug" @slotchange=${this._handleSlugChange}></slot>
      ${this.hasCloseIcon||(this===null||this===void 0?void 0:this._actionsCount)===0?p`<cds-modal-close-button
            close-button-label=${t}
            @click=${this._handleUserInitiatedClose}></cds-modal-close-button>`:""}
    </cds-modal-header>`;return p`
      <a
        id="start-sentinel"
        class="${c}--visually-hidden"
        href="javascript:void 0"
        role="navigation"></a>
      <div
        aria-label=${this.ariaLabel}
        class=${`${a}__container ${c}--modal-container ${c}--modal-container--sm`}
        part="dialog"
        role="complementary"
        ?open=${this._isOpen}
        ?opening=${o&&!this._isOpen}
        ?closing=${!o&&this._isOpen}
        width=${l}
        stack-position=${this._stackPosition}
        stack-depth=${this._stackDepth}
        @click=${this._handleClickContainer}>
        <!-- Header -->
        ${g}

        <!-- Body  -->
        <cds-modal-body class=${`${a}__body`} width=${l}>
          <!-- Influencer when on left -->
          ${e!==$.RIGHT?p`<div
                class=${`${a}__influencer`}
                ?wide=${n==="wide"}
                ?hidden=${!this._hasInfluencerLeft||this.width===f.NARROW}>
                <slot
                  name="influencer"
                  data-postfix="left"
                  @slotchange=${this._checkSetHasSlot}></slot>
              </div>`:""}

          <div class=${`${a}__right`}>
            <div class=${`${a}__main`}>
              <div class=${`${a}__content`}>
                <cds-layer level="0">
                  <slot></slot>
                </cds-layer>
              </div>

              <!-- Influencer when on right -->
              ${e===$.RIGHT?p`<div
                    class=${`${a}__influencer`}
                    ?wide=${n}
                    ?hidden=${!this._hasInfluencerRight||this.width===f.NARROW}>
                    <slot
                      name="influencer"
                      data-postfix="right"
                      @slotchange=${this._checkSetHasSlot}></slot>
                  </div>`:""}
            </div>
            <!-- Action buttons -->
            <cds-button-set-base
              class=${`${a}__buttons ${a}__button-container`}
              actions-multiple=${h}
              ?tearsheet-wide=${l==="wide"}
              ?hidden=${this._actionsCount===0}>
              <slot
                name="actions"
                @slotchange=${this._handleActionsChange}></slot>
            </cds-button-set-base>
          </div>
        </cds-modal-body>
      </div>
      <a
        id="end-sentinel"
        class="${c}--visually-hidden"
        href="javascript:void 0"
        role="navigation"></a>
    `}async updated(t){if(t.has("width")&&this._checkUpdateActionSizes(),t.has("open"))if(this._updateStack(),this._checkSetOpen(),this.open){this._launcher=this.ownerDocument.activeElement;let e=this.selectorInitialFocus&&this.querySelector(this.selectorInitialFocus);await this.constructor._delay(),e?e.focus():S(this.querySelectorAll(this.constructor.selectorTabbable))||this.focus()}else this._launcher&&typeof this._launcher.focus=="function"&&(this._launcher.focus(),this._launcher=null)}static _delay(t=0){return new Promise(e=>{setTimeout(e,t)})}static get selectorCloseButton(){return`[data-modal-close],${c}-modal-close-button`}static get selectorTabbable(){return O}static get eventBeforeClose(){return`${c}-tearsheet-beingclosed`}static get eventClose(){return`${c}-tearsheet-closed`}static get eventNavigateBack(){return`${c}-tearsheet-header-navigate-back`}};s._stack={open:[],all:[]};i([b("#start-sentinel")],s.prototype,"_startSentinelNode",void 0);i([b("#end-sentinel")],s.prototype,"_endSentinelNode",void 0);i([b(`.${a}__container`)],s.prototype,"_tearsheet",void 0);i([I({slot:"actions",selector:`${c}-button`})],s.prototype,"_actions",void 0);i([r()],s.prototype,"_actionsCount",void 0);i([r()],s.prototype,"_hasHeaderActions",void 0);i([r()],s.prototype,"_hasLabel",void 0);i([r()],s.prototype,"_hasSlug",void 0);i([r()],s.prototype,"_hasTitle",void 0);i([r()],s.prototype,"_hasDescription",void 0);i([r()],s.prototype,"_hasInfluencerLeft",void 0);i([r()],s.prototype,"_hasInfluencerRight",void 0);i([r()],s.prototype,"_isOpen",void 0);i([r()],s.prototype,"_hasHeaderNavigation",void 0);i([k("click")],s.prototype,"_handleClick",void 0);i([k("shadowRoot:focusout")],s.prototype,"_handleBlur",void 0);i([k("document:keydown")],s.prototype,"_handleKeydown",void 0);i([u({reflect:!0,attribute:"aria-label"})],s.prototype,"ariaLabel",void 0);i([u({reflect:!0,attribute:"close-icon-description"})],s.prototype,"closeIconDescription",void 0);i([u({reflect:!0,type:Boolean,attribute:"has-close-icon"})],s.prototype,"hasCloseIcon",void 0);i([u({reflect:!0,attribute:"influencer-placement"})],s.prototype,"influencerPlacement",void 0);i([u({reflect:!0,attribute:"influencer-width"})],s.prototype,"influencerWidth",void 0);i([u({type:Boolean,reflect:!0})],s.prototype,"open",void 0);i([u({type:Boolean,attribute:"prevent-close-on-click-outside"})],s.prototype,"preventCloseOnClickOutside",void 0);i([u({reflect:!0,attribute:"selector-initial-focus",type:String})],s.prototype,"selectorInitialFocus",void 0);i([u({reflect:!0,attribute:"width"})],s.prototype,"width",void 0);i([r()],s.prototype,"_stackDepth",void 0);i([r()],s.prototype,"_stackPosition",void 0);s=d=i([A(`${c}-tearsheet`)],s);
