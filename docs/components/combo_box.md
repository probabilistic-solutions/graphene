# `combo_box`

## basic

### default

```heex
<.combo_box label="Combo box" name="combo-box-default" title_text="Choose an option">
  <:item value="all">All</:item>
  <:item value="cloud">Cloud</:item>
  <:item value="edge">Edge</:item>
</.combo_box>
```

```html
<input type="hidden" id="combo-box-default-input" name="combo-box-default" value="">

<cds-combo-box clear-selection-label="Clear selection" direction="bottom" label="Combo box" name="combo-box-default" required-validity-message="Please fill out this field." size="md" title-text="Choose an option" type="" id="basic-single-default" phx-hook="Graphene.Internal.FormComponents.GrapheneFormBridge" data-form-input="combo-box-default-input" data-form-event="cds-combo-box-selected" data-form-mode="value" data-form-detail="checked">
  
  
  
    
<cds-combo-box-item size="md" value="all">
  
      All
    
</cds-combo-box-item>
  
    
<cds-combo-box-item size="md" value="cloud">
  
      Cloud
    
</cds-combo-box-item>
  
    
<cds-combo-box-item size="md" value="edge">
  
      Edge
    
</cds-combo-box-item>
  

  

</cds-combo-box>
```

### inline

```heex
<.combo_box label="Inline" name="combo-box-inline" type="inline" title_text="Inline combo">
  <:item value="ibm">IBM</:item>
  <:item value="redhat">Red Hat</:item>
  <:item value="hashicorp">HashiCorp</:item>
</.combo_box>
```

```html
<input type="hidden" id="combo-box-inline-input" name="combo-box-inline" value="">

<cds-combo-box clear-selection-label="Clear selection" direction="bottom" label="Inline" name="combo-box-inline" required-validity-message="Please fill out this field." size="md" title-text="Inline combo" type="inline" id="basic-single-inline" phx-hook="Graphene.Internal.FormComponents.GrapheneFormBridge" data-form-input="combo-box-inline-input" data-form-event="cds-combo-box-selected" data-form-mode="value" data-form-detail="checked">
  
  
  
    
<cds-combo-box-item size="md" value="ibm">
  
      IBM
    
</cds-combo-box-item>
  
    
<cds-combo-box-item size="md" value="redhat">
  
      Red Hat
    
</cds-combo-box-item>
  
    
<cds-combo-box-item size="md" value="hashicorp">
  
      HashiCorp
    
</cds-combo-box-item>
  

  

</cds-combo-box>
```

### group: sizes

```heex
<.combo_box label="SM" name="combo-box-sm" size="sm" title_text="Size sm">
  <:item value="one">One</:item>
  <:item value="two">Two</:item>
</.combo_box>
<.combo_box label="MD" name="combo-box-md" size="md" title_text="Size md">
  <:item value="one">One</:item>
  <:item value="two">Two</:item>
</.combo_box>
<.combo_box label="LG" name="combo-box-lg" size="lg" title_text="Size lg">
  <:item value="one">One</:item>
  <:item value="two">Two</:item>
</.combo_box>
```

```html
<input type="hidden" id="combo-box-sm-input" name="combo-box-sm" value="">

<cds-combo-box clear-selection-label="Clear selection" direction="bottom" label="SM" name="combo-box-sm" required-validity-message="Please fill out this field." size="sm" title-text="Size sm" type="" id="basic-sizes-sm" phx-hook="Graphene.Internal.FormComponents.GrapheneFormBridge" data-form-input="combo-box-sm-input" data-form-event="cds-combo-box-selected" data-form-mode="value" data-form-detail="checked">
  
  
  
    
<cds-combo-box-item size="md" value="one">
  
      One
    
</cds-combo-box-item>
  
    
<cds-combo-box-item size="md" value="two">
  
      Two
    
</cds-combo-box-item>
  

  

</cds-combo-box>

<input type="hidden" id="combo-box-md-input" name="combo-box-md" value="">

<cds-combo-box clear-selection-label="Clear selection" direction="bottom" label="MD" name="combo-box-md" required-validity-message="Please fill out this field." size="md" title-text="Size md" type="" id="basic-sizes-md" phx-hook="Graphene.Internal.FormComponents.GrapheneFormBridge" data-form-input="combo-box-md-input" data-form-event="cds-combo-box-selected" data-form-mode="value" data-form-detail="checked">
  
  
  
    
<cds-combo-box-item size="md" value="one">
  
      One
    
</cds-combo-box-item>
  
    
<cds-combo-box-item size="md" value="two">
  
      Two
    
</cds-combo-box-item>
  

  

</cds-combo-box>

<input type="hidden" id="combo-box-lg-input" name="combo-box-lg" value="">

<cds-combo-box clear-selection-label="Clear selection" direction="bottom" label="LG" name="combo-box-lg" required-validity-message="Please fill out this field." size="lg" title-text="Size lg" type="" id="basic-sizes-lg" phx-hook="Graphene.Internal.FormComponents.GrapheneFormBridge" data-form-input="combo-box-lg-input" data-form-event="cds-combo-box-selected" data-form-mode="value" data-form-detail="checked">
  
  
  
    
<cds-combo-box-item size="md" value="one">
  
      One
    
</cds-combo-box-item>
  
    
<cds-combo-box-item size="md" value="two">
  
      Two
    
</cds-combo-box-item>
  

  

</cds-combo-box>
```
