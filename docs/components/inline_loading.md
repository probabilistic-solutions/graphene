# `inline_loading`

## basic

### active

```heex
<.inline_loading status="active">
  Loading...
</.inline_loading>
```

```html
<cds-inline-loading icon-description="Loading" status="active" success-delay="1500" id="basic-single-active">
  
  Loading...

</cds-inline-loading>
```

### finished

```heex
<.inline_loading status="finished">
  Complete
</.inline_loading>
```

```html
<cds-inline-loading icon-description="Loading" status="finished" success-delay="1500" id="basic-single-finished">
  
  Complete

</cds-inline-loading>
```

### error

```heex
<.inline_loading status="error">
  Failed
</.inline_loading>
```

```html
<cds-inline-loading icon-description="Loading" status="error" success-delay="1500" id="basic-single-error">
  
  Failed

</cds-inline-loading>
```
