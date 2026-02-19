# `fluid_search`

## basic

### default

```heex
<.fluid_search name="fluid-search-default" label_text="Search" placeholder="Search"/>
```

```html
<input type="hidden" id="fluid-search-default-input" name="fluid-search-default" value="">

<cds-fluid-search autocomplete="off" label-text="Search" name="fluid-search-default" placeholder="Search" size="md" id="basic-single-default" phx-hook="Graphene.Internal.FormComponents.GrapheneFormBridge" data-form-input="fluid-search-default-input" data-form-event="cds-search-input" data-form-mode="value" data-form-detail="checked">
  
</cds-fluid-search>
```

### expandable

```heex
<.fluid_search name="fluid-search-expandable" label_text="Search" expanded expandable/>
```

```html
<input type="hidden" id="fluid-search-expandable-input" name="fluid-search-expandable" value="">

<cds-fluid-search autocomplete="off" expandable expanded label-text="Search" name="fluid-search-expandable" placeholder="Search" size="md" id="basic-single-expandable" phx-hook="Graphene.Internal.FormComponents.GrapheneFormBridge" data-form-input="fluid-search-expandable-input" data-form-event="cds-search-input" data-form-mode="value" data-form-detail="checked">
  
</cds-fluid-search>
```

### disabled

```heex
<.fluid_search disabled name="fluid-search-disabled" label_text="Search"/>
```

```html
<input type="hidden" id="fluid-search-disabled-input" name="fluid-search-disabled" value="">

<cds-fluid-search autocomplete="off" disabled label-text="Search" name="fluid-search-disabled" placeholder="Search" size="md" id="basic-single-disabled" phx-hook="Graphene.Internal.FormComponents.GrapheneFormBridge" data-form-input="fluid-search-disabled-input" data-form-event="cds-search-input" data-form-mode="value" data-form-detail="checked">
  
</cds-fluid-search>
```

### group: sizes

```heex
<.fluid_search name="fluid-search-sm" size="sm" label_text="Size sm"/>
<.fluid_search name="fluid-search-md" size="md" label_text="Size md"/>
<.fluid_search name="fluid-search-lg" size="lg" label_text="Size lg"/>
```

```html
<input type="hidden" id="fluid-search-sm-input" name="fluid-search-sm" value="">

<cds-fluid-search autocomplete="off" label-text="Size sm" name="fluid-search-sm" placeholder="Search" size="sm" id="basic-sizes-sm" phx-hook="Graphene.Internal.FormComponents.GrapheneFormBridge" data-form-input="fluid-search-sm-input" data-form-event="cds-search-input" data-form-mode="value" data-form-detail="checked">
  
</cds-fluid-search>

<input type="hidden" id="fluid-search-md-input" name="fluid-search-md" value="">

<cds-fluid-search autocomplete="off" label-text="Size md" name="fluid-search-md" placeholder="Search" size="md" id="basic-sizes-md" phx-hook="Graphene.Internal.FormComponents.GrapheneFormBridge" data-form-input="fluid-search-md-input" data-form-event="cds-search-input" data-form-mode="value" data-form-detail="checked">
  
</cds-fluid-search>

<input type="hidden" id="fluid-search-lg-input" name="fluid-search-lg" value="">

<cds-fluid-search autocomplete="off" label-text="Size lg" name="fluid-search-lg" placeholder="Search" size="lg" id="basic-sizes-lg" phx-hook="Graphene.Internal.FormComponents.GrapheneFormBridge" data-form-input="fluid-search-lg-input" data-form-event="cds-search-input" data-form-mode="value" data-form-detail="checked">
  
</cds-fluid-search>
```
