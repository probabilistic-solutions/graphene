# `inline_notification`

## notification/inline

### info

```heex
<.inline_notification kind="info">
  <:title>Updates available</:title>
  <:subtitle>Refresh to install the latest changes</:subtitle>
</.inline_notification>
```

```html
<cds-inline-notification kind="info" open id="inline-single-info">
  
  
  <div slot="subtitle">
    Refresh to install the latest changes
  </div>
  <div slot="title">
    Updates available
  </div>
</cds-inline-notification>
```

### warning

```heex
<.inline_notification kind="warning">
  <:title>Storage almost full</:title>
  <:subtitle>Clean up old files</:subtitle>
</.inline_notification>
```

```html
<cds-inline-notification kind="warning" open id="inline-single-warning">
  
  
  <div slot="subtitle">
    Clean up old files
  </div>
  <div slot="title">
    Storage almost full
  </div>
</cds-inline-notification>
```

### success

```heex
<.inline_notification kind="success">
  <:title>Saved</:title>
  <:subtitle>Your changes were saved</:subtitle>
</.inline_notification>
```

```html
<cds-inline-notification kind="success" open id="inline-single-success">
  
  
  <div slot="subtitle">
    Your changes were saved
  </div>
  <div slot="title">
    Saved
  </div>
</cds-inline-notification>
```
