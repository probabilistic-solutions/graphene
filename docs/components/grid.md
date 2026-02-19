# `grid`

### default

```heex
<.grid >
  <:column sm="2">Column 1</:column>
  <:column sm="2">Column 2</:column>
  <:column sm="2">Column 3</:column>
</.grid>
```

```html
<style>cds-grid[data-graphene-grid-id='graphene-grid-125954']::part(grid){row-gap: var(--cds-spacing-07);}</style>
<cds-grid id="grid-single-default" data-graphene-grid-id="graphene-grid-125954">
  
  
    
<cds-column sm="2">
  
      Column 1
    
</cds-column>
  
    
<cds-column sm="2">
  
      Column 2
    
</cds-column>
  
    
<cds-column sm="2">
  
      Column 3
    
</cds-column>
  

</cds-grid>
```

### condensed

```heex
<.grid condensed>
  <:column sm="1">One</:column>
  <:column sm="1">Two</:column>
  <:column sm="1">Three</:column>
  <:column sm="1">Four</:column>
</.grid>
```

```html
<style>cds-grid[data-graphene-grid-id='graphene-grid-126722']::part(grid){row-gap: var(--cds-grid-gutter);}</style>
<cds-grid condensed id="grid-single-condensed" data-graphene-grid-id="graphene-grid-126722">
  
  
    
<cds-column sm="1">
  
      One
    
</cds-column>
  
    
<cds-column sm="1">
  
      Two
    
</cds-column>
  
    
<cds-column sm="1">
  
      Three
    
</cds-column>
  
    
<cds-column sm="1">
  
      Four
    
</cds-column>
  

</cds-grid>
```

### full_width

```heex
<.grid full_width>
  <:column sm="2">Wide 1</:column>
  <:column sm="2">Wide 2</:column>
  <:column sm="2">Wide 3</:column>
</.grid>
```

```html
<style>cds-grid[data-graphene-grid-id='graphene-grid-127490']::part(grid){row-gap: var(--cds-spacing-07);}</style>
<cds-grid full-width id="grid-single-full-width" data-graphene-grid-id="graphene-grid-127490">
  
  
    
<cds-column sm="2">
  
      Wide 1
    
</cds-column>
  
    
<cds-column sm="2">
  
      Wide 2
    
</cds-column>
  
    
<cds-column sm="2">
  
      Wide 3
    
</cds-column>
  

</cds-grid>
```
