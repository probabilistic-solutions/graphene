# `actionable_notification`

## notification/actionable

### default

```heex
<.actionable_notification action_button_label="View report">
  <:title>Backup completed</:title>
  <:subtitle>View the report for details</:subtitle>
</.actionable_notification>
```

```html
<cds-actionable-notification action-button-label="View report" close-on-escape has-focus kind="success" open id="actionable-single-default">
  
  
  <div slot="subtitle">
    View the report for details
  </div>
  <div slot="title">
    Backup completed
  </div>
  
</cds-actionable-notification>
```

### warning

```heex
<.actionable_notification kind="warning" action_button_label="Manage">
  <:title>Storage almost full</:title>
  <:subtitle>Upgrade or remove files</:subtitle>
</.actionable_notification>
```

```html
<cds-actionable-notification action-button-label="Manage" close-on-escape has-focus kind="warning" open id="actionable-single-warning">
  
  
  <div slot="subtitle">
    Upgrade or remove files
  </div>
  <div slot="title">
    Storage almost full
  </div>
  
</cds-actionable-notification>
```

### error

```heex
<.actionable_notification kind="error" action_button_label="Retry">
  <:title>Sync failed</:title>
  <:subtitle>Retry the sync</:subtitle>
</.actionable_notification>
```

```html
<cds-actionable-notification action-button-label="Retry" close-on-escape has-focus kind="error" open id="actionable-single-error">
  
  
  <div slot="subtitle">
    Retry the sync
  </div>
  <div slot="title">
    Sync failed
  </div>
  
</cds-actionable-notification>
```
