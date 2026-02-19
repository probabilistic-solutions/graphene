import{a as d}from"./chunk-QRN6BYLI.js";import{a as c}from"./chunk-5KAQSVR4.js";import{a as n}from"./chunk-SMKH7ZGP.js";import{a as m}from"./chunk-IJO64LAV.js";import{b as o}from"./chunk-DPD5ZZAY.js";import{a as r}from"./chunk-S4Z7DAZ3.js";import{a as l}from"./chunk-5DYO2IB6.js";import{a as e,f as s,j as p}from"./chunk-TII5QPTS.js";var u={elem:"svg",attrs:{xmlns:"http://www.w3.org/2000/svg",viewBox:"0 0 32 32",fill:"currentColor",width:16,height:16},content:[{elem:"path",attrs:{d:"M28,10V28H10V10H28m0-2H10a2,2,0,0,0-2,2V28a2,2,0,0,0,2,2H28a2,2,0,0,0,2-2V10a2,2,0,0,0-2-2Z"}},{elem:"path",attrs:{d:"M4,18H2V4A2,2,0,0,1,4,2H18V4H4Z"}}],name:"copy",size:16};var t=class extends m(p){constructor(){super(...arguments),this.disabled=!1,this.feedback="Copied!",this.align=c.BOTTOM,this.autoAlign=!1,this.feedbackTimeout=2e3}render(){let{buttonClassName:a,disabled:f,feedback:b,feedbackTimeout:y,align:g,autoAlign:h}=this,i=`${r}--copy-btn`;return a&&(i+=` ${a}`),s`
      <cds-copy
        ?disabled=${f}
        ?autoalign=${h}
        feedback=${b}
        feedback-timeout=${y}
        button-class-name=${i}
        exportparts="button"
        align=${g}>
        ${n(u,{slot:"icon",class:`${r}--snippet__icon`})}
        <slot slot="tooltip-content"></slot>
      </cds-copy>
    `}};t.styles=d;e([o({reflect:!0,attribute:"button-class-name"})],t.prototype,"buttonClassName",void 0);e([o({type:Boolean,reflect:!0})],t.prototype,"disabled",void 0);e([o()],t.prototype,"feedback",void 0);e([o({reflect:!0})],t.prototype,"align",void 0);e([o({type:Boolean,reflect:!0})],t.prototype,"autoAlign",void 0);e([o({type:Number,attribute:"feedback-timeout"})],t.prototype,"feedbackTimeout",void 0);t=e([l(`${r}-copy-button`)],t);
