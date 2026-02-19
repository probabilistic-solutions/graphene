import{a as m}from"./chunk-LZBIHW57.js";import{a as L}from"./chunk-VLUTYSTF.js";import{a as I}from"./chunk-3H3P3VGF.js";import{a as v}from"./chunk-SMKH7ZGP.js";import{a as _}from"./chunk-NB5AMTOW.js";import{b as l}from"./chunk-DPD5ZZAY.js";import{a as e}from"./chunk-S4Z7DAZ3.js";import{a as b}from"./chunk-5DYO2IB6.js";import{a as t,f as n,j as p}from"./chunk-TII5QPTS.js";var f;(function(h){h.HORIZONTAL="horizontal",h.VERTICAL="vertical"})(f||(f={}));var o=class extends p{constructor(){super(...arguments),this.orientation=f.VERTICAL,this.readonly=!1,this.warn=!1,this.warnText="",this._hasAILabel=!1}_handleSlotChange({target:a}){let s=a.assignedNodes().filter(i=>i.matches!==void 0?i.matches(this.constructor.aiLabelItem)||i.matches(this.constructor.slugItem):!1);this._hasAILabel=!!s,s[0].setAttribute("size","mini"),this.requestUpdate()}updated(a){let{selectorCheckbox:s}=this.constructor,i=this.querySelectorAll(s);if(["disabled","readonly","orientation"].forEach(r=>{if(a.has(r)){let{[r]:c}=this;i.forEach(u=>{u[r]=c})}}),a.has("invalid")){let{invalid:r}=this;i.forEach(c=>{r?c.setAttribute("invalid-group",""):c.removeAttribute("invalid-group")})}}render(){let{ariaLabelledBy:a,disabled:s,helperText:i,invalid:r,invalidText:c,legendId:u,legendText:T,orientation:g,readonly:d,warn:x,warnText:w,_hasAILabel:A,_handleSlotChange:$}=this,k=!d&&!r&&x,E=!r&&!x,O=Math.random().toString(16).slice(2),C=i?`checkbox-group-helper-text-${O}`:void 0,S=i?n` <div id="${C}" class="${e}--form__helper-text">
          ${i}
        </div>`:null,B=_({[`${e}--checkbox-group`]:!0,[`${e}--checkbox-group--readonly`]:d,[`${e}--checkbox-group--invalid`]:!d&&r,[`${e}--checkbox-group--warning`]:k,[`${e}--checkbox-group--slug`]:A,[`${e}--checkbox-group--${g}`]:g==="horizontal"});return n`
      <fieldset
        class="${B}"
        ?data-invalid=${r}
        ?disabled=${s}
        aria-disabled=${d}
        ?aria-labelledby=${a||u}
        ?aria-describedby=${!r&&!x&&S?C:void 0}
        orientation=${g}>
        <legend class="${e}--label" id=${u||a}>
          ${T}
          <slot name="ai-label" @slotchange="${$}"></slot>
          <slot name="decorator" @slotchange="${$}"></slot>
          <slot name="slug" @slotchange="${$}"></slot>
        </legend>
        <slot></slot>
        <div class="${e}--checkbox-group__validation-msg">
          ${!d&&r?n`
                ${v(I,{class:`${e}--checkbox__invalid-icon`})}
                <div class="${e}--form-requirement">${c}</div>
              `:null}
          ${k?n`
                ${v(L,{class:`${e}--checkbox__invalid-icon ${e}--checkbox__invalid-icon--warning`})}
                <div class="${e}--form-requirement">${w}</div>
              `:null}
        </div>
        ${E?S:null}
      </fieldset>
    `}static get selectorCheckbox(){return`${e}-checkbox`}static get slugItem(){return`${e}-slug`}static get aiLabelItem(){return`${e}-ai-label`}};o.shadowRootOptions=Object.assign(Object.assign({},p.shadowRootOptions),{delegatesFocus:!0});o.styles=m;t([l({type:String,reflect:!0,attribute:"aria-labelledby"})],o.prototype,"ariaLabelledBy",void 0);t([l({type:Boolean})],o.prototype,"disabled",void 0);t([l({type:String,reflect:!0,attribute:"helper-text"})],o.prototype,"helperText",void 0);t([l({type:Boolean,attribute:"invalid"})],o.prototype,"invalid",void 0);t([l({type:String,reflect:!0,attribute:"invalid-text"})],o.prototype,"invalidText",void 0);t([l({type:String,reflect:!0,attribute:"legend-id"})],o.prototype,"legendId",void 0);t([l({type:String,reflect:!0,attribute:"legend-text"})],o.prototype,"legendText",void 0);t([l({type:String,reflect:!0,attribute:"orientation"})],o.prototype,"orientation",void 0);t([l({type:Boolean,reflect:!0})],o.prototype,"readonly",void 0);t([l({type:Boolean,reflect:!0})],o.prototype,"warn",void 0);t([l({type:String,reflect:!0,attribute:"warn-text"})],o.prototype,"warnText",void 0);o=t([b(`${e}-checkbox-group`)],o);var y=class extends p{render(){return n`
      <label class="${e}--checkbox-label" for="checkbox" part="label">
        <span class="${e}--checkbox-label-text ${e}--skeleton"
          ><slot></slot
        ></span>
      </label>
    `}};y.styles=m;y=t([b(`${e}-checkbox-skeleton`)],y);
