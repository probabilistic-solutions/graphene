# `toast_notification`

## notification/toast

### success

```heex
<.toast_notification timeout="3000" kind="success">
  <:title>Saved</:title>
  <:subtitle>Your changes were saved</:subtitle>
</.toast_notification>
```

```html
<cds-toast-notification kind="success" open timeout="3000" id="toast-single-success">
  
  
  <div slot="subtitle">
    Your changes were saved
  </div>
  <div slot="title">
    Saved
  </div>
</cds-toast-notification>
```

### info

```heex
<.toast_notification timeout="5000" kind="info">
  <:title>New message</:title>
  <:subtitle>You have unread messages</:subtitle>
</.toast_notification>
```

```html
<cds-toast-notification kind="info" open timeout="5000" id="toast-single-info">
  
  
  <div slot="subtitle">
    You have unread messages
  </div>
  <div slot="title">
    New message
  </div>
</cds-toast-notification>
```

### error

```heex
<.toast_notification timeout="3000" kind="error">
  <:title>Failed</:title>
  <:subtitle>Try again</:subtitle>
</.toast_notification>
```

```html
<cds-toast-notification kind="error" open timeout="3000" id="toast-single-error">
  
  
  <div slot="subtitle">
    Try again
  </div>
  <div slot="title">
    Failed
  </div>
</cds-toast-notification>
```
