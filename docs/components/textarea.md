# `textarea`

## basic

### default

```heex
<.textarea id="basic-single-default" name="textarea-default" rows="3">
  <:label_text>Notes</:label_text>
</.textarea>
```

```html
<input type="hidden" id="basic-single-default-input" name="textarea-default" value="">
<cds-textarea hidePasswordLabel="Hide password" name="textarea-default" required-validity-message="Please fill out this field." rows="3" showPasswordLabel="Show password" size="md" tooltipAlignment="center" tooltipDirection="bottom" type="text" id="basic-single-default" data-form-detail="checked" data-form-event="input" data-form-input="basic-single-default-input" data-form-mode="value" phx-hook="Graphene.FormComponents.GrapheneFormBridge">
  
  
  
  <div slot="label-text">
    Notes
  </div>
  
</cds-textarea>
```

### helper_text

```heex
<.textarea id="basic-single-helper-text" name="textarea-helper" rows="4">
  <:label_text>Description</:label_text>
  <:helper_text>Max 300 characters</:helper_text>
</.textarea>
```

```html
<input type="hidden" id="basic-single-helper-text-input" name="textarea-helper" value="">
<cds-textarea hidePasswordLabel="Hide password" name="textarea-helper" required-validity-message="Please fill out this field." rows="4" showPasswordLabel="Show password" size="md" tooltipAlignment="center" tooltipDirection="bottom" type="text" id="basic-single-helper-text" data-form-detail="checked" data-form-event="input" data-form-input="basic-single-helper-text-input" data-form-mode="value" phx-hook="Graphene.FormComponents.GrapheneFormBridge">
  
  
  <div slot="helper-text">
    Max 300 characters
  </div>
  <div slot="label-text">
    Description
  </div>
  
</cds-textarea>
```

### invalid

```heex
<.textarea
  id="basic-single-invalid"
  invalid
  name="textarea-invalid"
  rows="3"
  invalid_text="Required"
>
  <:label_text>Reason</:label_text>
</.textarea>
```

```html
<input type="hidden" id="basic-single-invalid-input" name="textarea-invalid" value="">
<cds-textarea hidePasswordLabel="Hide password" invalid invalid-text="Required" name="textarea-invalid" required-validity-message="Please fill out this field." rows="3" showPasswordLabel="Show password" size="md" tooltipAlignment="center" tooltipDirection="bottom" type="text" id="basic-single-invalid" data-form-detail="checked" data-form-event="input" data-form-input="basic-single-invalid-input" data-form-mode="value" phx-hook="Graphene.FormComponents.GrapheneFormBridge">
  
  
  
  <div slot="label-text">
    Reason
  </div>
  
</cds-textarea>
```
