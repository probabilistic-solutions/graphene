# `callout_notification`

## notification/callout

### warning

```heex
<.callout_notification kind="warning">
  <:title>Plan limit reached</:title>
  <:subtitle>Upgrade to continue</:subtitle>
</.callout_notification>
```

```html
<cds-callout-notification close-on-escape has-focus kind="warning" open id="callout-single-warning">
  
  
  
  <div slot="subtitle">
    Upgrade to continue
  </div>
  <div slot="title">
    Plan limit reached
  </div>
</cds-callout-notification>
```

### success

```heex
<.callout_notification kind="success">
  <:title>Payment received</:title>
  <:subtitle>Your invoice is paid</:subtitle>
</.callout_notification>
```

```html
<cds-callout-notification close-on-escape has-focus kind="success" open id="callout-single-success">
  
  
  
  <div slot="subtitle">
    Your invoice is paid
  </div>
  <div slot="title">
    Payment received
  </div>
</cds-callout-notification>
```

### error

```heex
<.callout_notification kind="error">
  <:title>Payment failed</:title>
  <:subtitle>Update your card</:subtitle>
</.callout_notification>
```

```html
<cds-callout-notification close-on-escape has-focus kind="error" open id="callout-single-error">
  
  
  
  <div slot="subtitle">
    Update your card
  </div>
  <div slot="title">
    Payment failed
  </div>
</cds-callout-notification>
```
