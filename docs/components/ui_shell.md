# `ui_shell`

### example

```heex
<.ui_shell content_class="psb-ui-shell-content">
      <:skip_to_content>
        <a href="#main-content">Skip to content</a>
      </:skip_to_content>
      <:header>
        <.header>
          <:name href="#">Graphene</:name>
          <.header_nav>
            <.header_nav_item href="#">Home</.header_nav_item>
            <.header_nav_item href="#">Docs</.header_nav_item>
          </.header_nav>
        </.header>
      </:header>
      <:side_nav>
        <.side_nav expanded={true}>
          <.side_nav_items>
            <.side_nav_link href="#">Dashboard</.side_nav_link>
            <.side_nav_link href="#">Settings</.side_nav_link>
          </.side_nav_items>
        </.side_nav>
      </:side_nav>
      <:content>
        <div id="main-content" style="padding: 1rem;">
          <.button kind="secondary" href="/" size="sm">Return to storybook</.button>
          <div style="margin-top: 1rem;">
            Main content area
          </div>
        </div>
      </:content>
    </.ui_shell>
```

```html
<div>
  
    <a href="#main-content">Skip to content</a>
  
  
    <cds-header>
  
  
    <cds-header-name href="#">
  
      Graphene
    
</cds-header-name>
  
  
      <cds-header-nav>
  
        <cds-header-nav-item href="#" role="listitem">
  Home
</cds-header-nav-item>
        <cds-header-nav-item href="#" role="listitem">
  Docs
</cds-header-nav-item>
      
</cds-header-nav>
    

</cds-header>
  
  
    <cds-side-nav collapse-mode="responsive" expanded>
  
      <cds-side-nav-items>
  
        <cds-side-nav-link href="#">
  Dashboard
  
  
  
</cds-side-nav-link>
        <cds-side-nav-link href="#">
  Settings
  
  
  
</cds-side-nav-link>
      
</cds-side-nav-items>
    
</cds-side-nav>
  
  <main class="psb-ui-shell-content">
    
    <div id="main-content" style="padding: 1rem;">
      <cds-button href="/" kind="secondary" link-role="button" size="sm" tab-index="0" tooltip-alignment="" tooltip-position="top" type="button">
  Return to storybook
  
</cds-button>
      <div style="margin-top: 1rem;">
        Main content area
      </div>
    </div>
  
  </main>
</div>
```
