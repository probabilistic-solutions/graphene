# `toggle`

## basic

### on

```heex
<.toggle name="toggle-on" label_a="On" label_b="Off" toggled>
  <:label_text>Notifications</:label_text>
</.toggle>
```

```html
<input type="hidden" id="basic-single-on-input" name="toggle-on" value="true">

<cds-toggle checked id="basic-single-on" label-a="On" label-b="Off" name="toggle-on" size="" toggled id="basic-single-on" phx-hook="Graphene.Internal.FormComponents.GrapheneFormBridge" data-form-input="basic-single-on-input" data-form-event="cds-toggle-changed" data-form-mode="boolean" data-form-detail="toggled">
  
  
  
  <div slot="label-text">
    Notifications
  </div>
  
</cds-toggle>
```

### off

```heex
<.toggle name="toggle-off" label_a="On" label_b="Off">
  <:label_text>Notifications</:label_text>
</.toggle>
```

```html
<input type="hidden" id="basic-single-off-input" name="toggle-off" value="false">

<cds-toggle id="basic-single-off" label-a="On" label-b="Off" name="toggle-off" size="" id="basic-single-off" phx-hook="Graphene.Internal.FormComponents.GrapheneFormBridge" data-form-input="basic-single-off-input" data-form-event="cds-toggle-changed" data-form-mode="boolean" data-form-detail="toggled">
  
  
  
  <div slot="label-text">
    Notifications
  </div>
  
</cds-toggle>
```

### disabled

```heex
<.toggle disabled name="toggle-disabled" label_a="On" label_b="Off">
  <:label_text>Disabled</:label_text>
</.toggle>
```

```html
<input type="hidden" id="basic-single-disabled-input" name="toggle-disabled" value="false">

<cds-toggle disabled id="basic-single-disabled" label-a="On" label-b="Off" name="toggle-disabled" size="" id="basic-single-disabled" phx-hook="Graphene.Internal.FormComponents.GrapheneFormBridge" data-form-input="basic-single-disabled-input" data-form-event="cds-toggle-changed" data-form-mode="boolean" data-form-detail="toggled">
  
  
  
  <div slot="label-text">
    Disabled
  </div>
  
</cds-toggle>
```
