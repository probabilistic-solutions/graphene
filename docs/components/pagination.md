# `pagination`

## basic

### default

```heex
<.pagination total_items="105" page_size="10"/>
```

```html
<cds-pagination backward-text="Previous page" forward-text="Next page" items-per-page-text="Items per page:" page="1" page-size="10" size="md" start="0" total-items="105" totalPages="1" id="basic-single-default">
  
  
</cds-pagination>
```

### small

```heex
<.pagination size="sm" total_items="42" page_size="5"/>
```

```html
<cds-pagination backward-text="Previous page" forward-text="Next page" items-per-page-text="Items per page:" page="1" page-size="5" size="sm" start="0" total-items="42" totalPages="1" id="basic-single-small">
  
  
</cds-pagination>
```

### unknown

```heex
<.pagination total_items="" pages_unknown page_size="10"/>
```

```html
<cds-pagination backward-text="Previous page" forward-text="Next page" items-per-page-text="Items per page:" page="1" page-size="10" pages-unknown size="md" start="0" total-items="" totalPages="1" id="basic-single-unknown">
  
  
</cds-pagination>
```
