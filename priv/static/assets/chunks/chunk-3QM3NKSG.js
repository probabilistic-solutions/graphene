import{a as p}from"./chunk-LLDSBWCT.js";import{a as u}from"./chunk-HGK3H7QL.js";import{a as f}from"./chunk-5KAQSVR4.js";import{b as n,c as d}from"./chunk-DPD5ZZAY.js";import{a as r}from"./chunk-S4Z7DAZ3.js";import{a as h}from"./chunk-5DYO2IB6.js";import{a as o,c as s,f as l,j as a}from"./chunk-TII5QPTS.js";var e=class extends a{constructor(){super(...arguments),this.align="bottom",this.autoalign=!1,this.defaultOpen=!1,this.openOnHover=!1,this.open=!1}connectedCallback(){super.connectedCallback(),s(this.renderRoot,[u,p]),this.hasAttribute("default-open")&&(this.open=!0)}_handleBlur(){this.open=!1}_handleMouseDown(){this.open=!this.open}_handleKeyDown(i){let{key:t}=i;this.open&&(t==="Esc"||t==="Escape")&&(i.stopPropagation(),this.open=!1)}_handleHover(){this.openOnHover&&!this.open?this.open=!0:this.open=!1}_handleFocus(){this.open=!0}render(){let{align:i,open:t}=this;return l`
      <cds-popover
        @mouseenter=${this._handleHover}
        @mouseleave=${this._handleHover}
        highContrast
        dropShadow=${!1}
        align=${i}
        .open=${t}>
        <button
          @focus=${this._handleFocus}
          @blur=${this._handleBlur}
          @mousedown=${this._handleMouseDown}
          @keydown=${this._handleKeyDown}
          aria-expanded=${t}
          part="definition-term"
          class="${r}--definition-term">
          <slot></slot>
        </button>
        <cds-popover-content>
          <slot name="definition"></slot>
        </cds-popover-content>
      </cds-popover>
    `}};e.styles=p;o([n({reflect:!0,type:f})],e.prototype,"align",void 0);o([n({type:Boolean,reflect:!0})],e.prototype,"autoalign",void 0);o([n({type:Boolean,reflect:!0,attribute:"default-open"})],e.prototype,"defaultOpen",void 0);o([n({reflect:!0,type:Boolean,attribute:"open-on-hover"})],e.prototype,"openOnHover",void 0);o([d()],e.prototype,"open",void 0);e=o([h(`${r}-definition-tooltip`)],e);
