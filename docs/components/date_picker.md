# `date_picker`

## basic

### single

```heex
<.date_picker name="date-picker-single" date_format="d/m/Y">
  <:input label="Start date" placeholder="dd/mm/yyyy" />
</.date_picker>
```

```html
<input type="hidden" id="date-picker-single-input" name="date-picker-single" value="">

<cds-date-picker allow-input close-on-select date-format="d/m/Y" name="date-picker-single" id="basic-single-single" phx-hook="Graphene.Internal.FormComponents.GrapheneFormBridge" data-form-input="date-picker-single-input" data-form-event="cds-date-picker-changed" data-form-mode="value" data-form-detail="checked">
  
  
    
<cds-date-picker-input color-scheme="" label-text="Start date" placeholder="dd/mm/yyyy" size="md">
  
</cds-date-picker-input>
  

</cds-date-picker>
```

### range

```heex
<.date_picker name="date-picker-range" value="2024-01-10/2024-01-14" date_format="d/m/Y">
  <:input label="Start" placeholder="dd/mm/yyyy" />
  <:input label="End" placeholder="dd/mm/yyyy" />
</.date_picker>
```

```html
<input type="hidden" id="date-picker-range-input" name="date-picker-range" value="2024-01-10/2024-01-14">

<cds-date-picker allow-input close-on-select date-format="d/m/Y" name="date-picker-range" value="2024-01-10/2024-01-14" id="basic-single-range" phx-hook="Graphene.Internal.FormComponents.GrapheneFormBridge" data-form-input="date-picker-range-input" data-form-event="cds-date-picker-changed" data-form-mode="value" data-form-detail="checked">
  
  
    
<cds-date-picker-input color-scheme="" label-text="Start" placeholder="dd/mm/yyyy" size="md">
  
</cds-date-picker-input>
  
    
<cds-date-picker-input color-scheme="" label-text="End" placeholder="dd/mm/yyyy" size="md">
  
</cds-date-picker-input>
  

</cds-date-picker>
```

### disabled

```heex
<.date_picker disabled name="date-picker-disabled" date_format="d/m/Y">
  <:input label="Disabled" placeholder="dd/mm/yyyy" disabled={true} />
</.date_picker>
```

```html
<input type="hidden" id="date-picker-disabled-input" name="date-picker-disabled" value="">

<cds-date-picker allow-input close-on-select date-format="d/m/Y" disabled name="date-picker-disabled" id="basic-single-disabled" phx-hook="Graphene.Internal.FormComponents.GrapheneFormBridge" data-form-input="date-picker-disabled-input" data-form-event="cds-date-picker-changed" data-form-mode="value" data-form-detail="checked">
  
  
    
<cds-date-picker-input color-scheme="" disabled label-text="Disabled" placeholder="dd/mm/yyyy" size="md">
  
</cds-date-picker-input>
  

</cds-date-picker>
```
