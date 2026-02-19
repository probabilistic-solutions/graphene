# `code_snippet`

### single

```heex
<.code_snippet type="single">
  npm install graphene
</.code_snippet>
```

```html
<cds-code-snippet feedback="Copied!" feedback-timeout="2000" maxCollapsedNumberOfRows="15" maxExpandedNumberOfRows="0" minCollapsedNumberOfRows="3" minExpandedNumberOfRows="16" show-less-text="Show less" show-more-text="Show more" tooltip-content="Copy to clipboard" type="single" id="code-snippet-single-single">
  
  npm install graphene

</cds-code-snippet>
```

### inline

```heex
<.code_snippet type="inline">
  mix test
</.code_snippet>
```

```html
<cds-code-snippet feedback="Copied!" feedback-timeout="2000" maxCollapsedNumberOfRows="15" maxExpandedNumberOfRows="0" minCollapsedNumberOfRows="3" minExpandedNumberOfRows="16" show-less-text="Show less" show-more-text="Show more" tooltip-content="Copy to clipboard" type="inline" id="code-snippet-single-inline">
  
  mix test

</cds-code-snippet>
```

### multi

```heex
<.code_snippet type="multi">
  mix graphene.core_components.generate
  mix graphene.stories.generate
</.code_snippet>
```

```html
<cds-code-snippet feedback="Copied!" feedback-timeout="2000" maxCollapsedNumberOfRows="15" maxExpandedNumberOfRows="0" minCollapsedNumberOfRows="3" minExpandedNumberOfRows="16" show-less-text="Show less" show-more-text="Show more" tooltip-content="Copy to clipboard" type="multi" id="code-snippet-single-multi">
  
  mix graphene.core_components.generate
mix graphene.stories.generate

</cds-code-snippet>
```

### wrapped

```heex
<.code_snippet type="single" wrap_text>
  npm install graphene --save
</.code_snippet>
```

```html
<cds-code-snippet feedback="Copied!" feedback-timeout="2000" maxCollapsedNumberOfRows="15" maxExpandedNumberOfRows="0" minCollapsedNumberOfRows="3" minExpandedNumberOfRows="16" show-less-text="Show less" show-more-text="Show more" tooltip-content="Copy to clipboard" type="single" wrap-text id="code-snippet-single-wrapped">
  
  npm install graphene --save

</cds-code-snippet>
```
