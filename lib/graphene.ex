defmodule Graphene do
  @moduledoc """
  Public Graphene facade.

  Usage:

      use Graphene

  <!-- STORYBOOK_DOCS:START -->

  ## Carbon Components Examples

  ### `accordion`

  #### basic

  ##### default

  ```heex
  <.accordion alignment="start">
    <:item title="Section 1" open={true}>
      This is the first section content.
    </:item>
    <:item title="Section 2">This is the second section content.</:item>
    <:item title="Disabled section" disabled={true}>
      This section is disabled but still visible for layout context.
    </:item>
  </.accordion>
  ```

  ```html
  <cds-accordion alignment="start" size="md" id="basic-single-default">
    
    
      <cds-accordion-item open title="Section 1">
    
        
    This is the first section content.

      
  </cds-accordion-item>
    
      <cds-accordion-item title="Section 2">
    
        This is the second section content.
      
  </cds-accordion-item>
    
      <cds-accordion-item disabled title="Disabled section">
    
        
    This section is disabled but still visible for layout context.

      
  </cds-accordion-item>
    

  </cds-accordion>
  ```

  ##### flush

  ```heex
  <.accordion is_flush>
    <:item title="Overview" open={true}>Summary content.</:item>
    <:item title="Details">More details about the section.</:item>
  </.accordion>
  ```

  ```html
  <cds-accordion isFlush size="md" id="basic-single-flush">
    
    
      <cds-accordion-item open title="Overview">
    
        Summary content.
      
  </cds-accordion-item>
    
      <cds-accordion-item title="Details">
    
        More details about the section.
      
  </cds-accordion-item>
    

  </cds-accordion>
  ```

  ##### group: sizes

  ```heex
  <.accordion size="sm">
    <:item title="First">Small content.</:item>
    <:item title="Second">More content.</:item>
  </.accordion>
  <.accordion size="md">
    <:item title="First">Small content.</:item>
    <:item title="Second">More content.</:item>
  </.accordion>
  <.accordion size="lg">
    <:item title="First">Small content.</:item>
    <:item title="Second">More content.</:item>
  </.accordion>
  ```

  ```html
  <cds-accordion size="sm" id="basic-sizes-sm">
    
    
      <cds-accordion-item title="First">
    
        Small content.
      
  </cds-accordion-item>
    
      <cds-accordion-item title="Second">
    
        More content.
      
  </cds-accordion-item>
    

  </cds-accordion>
  <cds-accordion size="md" id="basic-sizes-md">
    
    
      <cds-accordion-item title="First">
    
        Small content.
      
  </cds-accordion-item>
    
      <cds-accordion-item title="Second">
    
        More content.
      
  </cds-accordion-item>
    

  </cds-accordion>
  <cds-accordion size="lg" id="basic-sizes-lg">
    
    
      <cds-accordion-item title="First">
    
        Small content.
      
  </cds-accordion-item>
    
      <cds-accordion-item title="Second">
    
        More content.
      
  </cds-accordion-item>
    

  </cds-accordion>
  ```


  ### `actionable_notification`

  #### notification/actionable

  ##### default

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

  ##### warning

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

  ##### error

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


  ### `ai_label`

  ##### default

  ```heex
  <.ai_label alignment="bottom-start">
    <:body_text>
      <p class="secondary">AI Explained</p>
      <h2 class="ai-label-heading">84%</h2>
      <p class="secondary bold">Confidence score</p>
      <p class="secondary">Model type: Foundation</p>
    </:body_text>
    <:action_button>View details</:action_button>
  </.ai_label>
  ```

  ```html
  <cds-ai-label ai-text="AI" alignment="bottom-start" alignment-axis-offset="0" button-label="Show information" kind="" revert-label="Revert to AI input" size="xs" slot="ai-label" id="ai-label-single-default">
    
    <div slot="body-text">
      
    <p class="secondary">AI Explained</p>
    <h2 class="ai-label-heading">84%</h2>
    <p class="secondary bold">Confidence score</p>
    <p class="secondary">Model type: Foundation</p>

    </div>
    
    
      <cds-ai-label-action-button kind="primary" link-role="button" size="lg" slot="actions" tab-index="0" tooltip-alignment="" tooltip-position="top" type="button">
    
        View details
      
  </cds-ai-label-action-button>
    
    
    

    
    
  </cds-ai-label>
  ```

  ##### inline

  ```heex
  <.ai_label kind="inline" ai_text_label="Status" ai_text="AI-generated">
    <:body_text>
      <p class="secondary">Inline AI summary</p>
      <p class="secondary">Updated 2 mins ago</p>
    </:body_text>
    <:action_button>Review</:action_button>
  </.ai_label>
  ```

  ```html
  <cds-ai-label ai-text="AI-generated" ai-text-label="Status" alignment="top" alignment-axis-offset="0" button-label="Show information" kind="inline" revert-label="Revert to AI input" size="xs" slot="ai-label" id="ai-label-single-inline">
    
    <div slot="body-text">
      
    <p class="secondary">Inline AI summary</p>
    <p class="secondary">Updated 2 mins ago</p>

    </div>
    
    
      <cds-ai-label-action-button kind="primary" link-role="button" size="lg" slot="actions" tab-index="0" tooltip-alignment="" tooltip-position="top" type="button">
    
        Review
      
  </cds-ai-label-action-button>
    
    
    

    
    
  </cds-ai-label>
  ```

  ##### group: sizes

  ```heex
  <.ai_label size="sm" alignment="bottom-start">
    <:body_text>
      <p class="secondary">Model summary</p>
      <h2 class="ai-label-heading">76%</h2>
      <p class="secondary bold">Confidence</p>
    </:body_text>
    <:action_button>Open</:action_button>
  </.ai_label>
  <.ai_label size="md" alignment="bottom-start">
    <:body_text>
      <p class="secondary">Model summary</p>
      <h2 class="ai-label-heading">76%</h2>
      <p class="secondary bold">Confidence</p>
    </:body_text>
    <:action_button>Open</:action_button>
  </.ai_label>
  <.ai_label size="lg" alignment="bottom-start">
    <:body_text>
      <p class="secondary">Model summary</p>
      <h2 class="ai-label-heading">76%</h2>
      <p class="secondary bold">Confidence</p>
    </:body_text>
    <:action_button>Open</:action_button>
  </.ai_label>
  ```

  ```html
  <cds-ai-label ai-text="AI" alignment="bottom-start" alignment-axis-offset="0" button-label="Show information" kind="" revert-label="Revert to AI input" size="sm" slot="ai-label" id="ai-label-sizes-sm">
    
    <div slot="body-text">
      
    <p class="secondary">Model summary</p>
    <h2 class="ai-label-heading">76%</h2>
    <p class="secondary bold">Confidence</p>

    </div>
    
    
      <cds-ai-label-action-button kind="primary" link-role="button" size="lg" slot="actions" tab-index="0" tooltip-alignment="" tooltip-position="top" type="button">
    
        Open
      
  </cds-ai-label-action-button>
    
    
    

    
    
  </cds-ai-label>
  <cds-ai-label ai-text="AI" alignment="bottom-start" alignment-axis-offset="0" button-label="Show information" kind="" revert-label="Revert to AI input" size="md" slot="ai-label" id="ai-label-sizes-md">
    
    <div slot="body-text">
      
    <p class="secondary">Model summary</p>
    <h2 class="ai-label-heading">76%</h2>
    <p class="secondary bold">Confidence</p>

    </div>
    
    
      <cds-ai-label-action-button kind="primary" link-role="button" size="lg" slot="actions" tab-index="0" tooltip-alignment="" tooltip-position="top" type="button">
    
        Open
      
  </cds-ai-label-action-button>
    
    
    

    
    
  </cds-ai-label>
  <cds-ai-label ai-text="AI" alignment="bottom-start" alignment-axis-offset="0" button-label="Show information" kind="" revert-label="Revert to AI input" size="lg" slot="ai-label" id="ai-label-sizes-lg">
    
    <div slot="body-text">
      
    <p class="secondary">Model summary</p>
    <h2 class="ai-label-heading">76%</h2>
    <p class="secondary bold">Confidence</p>

    </div>
    
    
      <cds-ai-label-action-button kind="primary" link-role="button" size="lg" slot="actions" tab-index="0" tooltip-alignment="" tooltip-position="top" type="button">
    
        Open
      
  </cds-ai-label-action-button>
    
    
    

    
    
  </cds-ai-label>
  ```


  ### `ai_skeleton_icon`

  #### ai_skeleton/icon

  ##### small

  ```heex
  <.ai_skeleton_icon custom_styles="width: 16px; height: 16px;"/>
  ```

  ```html
  <cds-ai-skeleton-icon custom-styles="width: 16px; height: 16px;" id="icon-single-small">
    
  </cds-ai-skeleton-icon>
  ```

  ##### medium

  ```heex
  <.ai_skeleton_icon custom_styles="width: 24px; height: 24px;"/>
  ```

  ```html
  <cds-ai-skeleton-icon custom-styles="width: 24px; height: 24px;" id="icon-single-medium">
    
  </cds-ai-skeleton-icon>
  ```

  ##### large

  ```heex
  <.ai_skeleton_icon custom_styles="width: 32px; height: 32px;"/>
  ```

  ```html
  <cds-ai-skeleton-icon custom-styles="width: 32px; height: 32px;" id="icon-single-large">
    
  </cds-ai-skeleton-icon>
  ```


  ### `ai_skeleton_placeholder`

  #### ai_skeleton/placeholder

  ##### small

  ```heex
  <.ai_skeleton_placeholder style="width: 120px; height: 16px;"/>
  ```

  ```html
  <cds-ai-skeleton-placeholder id="placeholder-single-small" style="width: 120px; height: 16px;">
    
  </cds-ai-skeleton-placeholder>
  ```

  ##### medium

  ```heex
  <.ai_skeleton_placeholder style="width: 200px; height: 24px;"/>
  ```

  ```html
  <cds-ai-skeleton-placeholder id="placeholder-single-medium" style="width: 200px; height: 24px;">
    
  </cds-ai-skeleton-placeholder>
  ```

  ##### large

  ```heex
  <.ai_skeleton_placeholder style="width: 280px; height: 32px;"/>
  ```

  ```html
  <cds-ai-skeleton-placeholder id="placeholder-single-large" style="width: 280px; height: 32px;">
    
  </cds-ai-skeleton-placeholder>
  ```


  ### `ai_skeleton_text`

  #### ai_skeleton/text

  ##### single

  ```heex
  <.ai_skeleton_text width="60%"/>
  ```

  ```html
  <cds-ai-skeleton-text lineCount="3" width="60%" id="text-single-single">
    
  </cds-ai-skeleton-text>
  ```

  ##### paragraph

  ```heex
  <.ai_skeleton_text paragraph line_count="4"/>
  ```

  ```html
  <cds-ai-skeleton-text lineCount="4" paragraph width="100%" id="text-single-paragraph">
    
  </cds-ai-skeleton-text>
  ```

  ##### heading

  ```heex
  <.ai_skeleton_text width="40%" heading/>
  ```

  ```html
  <cds-ai-skeleton-text heading lineCount="3" width="40%" id="text-single-heading">
    
  </cds-ai-skeleton-text>
  ```


  ### `breadcrumb`

  ##### default

  ```heex
  <.breadcrumb >
    <:item href="#">Home</:item>
    <:item href="#">Catalog</:item>
    <:item current>Current page</:item>
  </.breadcrumb>
  ```

  ```html
  <cds-breadcrumb size="md" id="breadcrumb-single-default">
    
    
      <cds-breadcrumb-item>
    
        
          <cds-breadcrumb-link href="#" size="MEDIUM">
    
            Home
          
  </cds-breadcrumb-link>
        
      
  </cds-breadcrumb-item>
    
      <cds-breadcrumb-item>
    
        
          <cds-breadcrumb-link href="#" size="MEDIUM">
    
            Catalog
          
  </cds-breadcrumb-link>
        
      
  </cds-breadcrumb-item>
    
      <cds-breadcrumb-item>
    
        
          Current page
        
      
  </cds-breadcrumb-item>
    

  </cds-breadcrumb>
  ```

  ##### no_trailing_slash

  ```heex
  <.breadcrumb no_trailing_slash>
    <:item href="#">Home</:item>
    <:item href="#">Library</:item>
    <:item current>Components</:item>
  </.breadcrumb>
  ```

  ```html
  <cds-breadcrumb no-trailing-slash size="md" id="breadcrumb-single-no-trailing-slash">
    
    
      <cds-breadcrumb-item>
    
        
          <cds-breadcrumb-link href="#" size="MEDIUM">
    
            Home
          
  </cds-breadcrumb-link>
        
      
  </cds-breadcrumb-item>
    
      <cds-breadcrumb-item>
    
        
          <cds-breadcrumb-link href="#" size="MEDIUM">
    
            Library
          
  </cds-breadcrumb-link>
        
      
  </cds-breadcrumb-item>
    
      <cds-breadcrumb-item>
    
        
          Components
        
      
  </cds-breadcrumb-item>
    

  </cds-breadcrumb>
  ```

  ##### small

  ```heex
  <.breadcrumb size="sm">
    <:item href="#">Home</:item>
    <:item href="#">Docs</:item>
    <:item current>Breadcrumb</:item>
  </.breadcrumb>
  ```

  ```html
  <cds-breadcrumb size="sm" id="breadcrumb-single-small">
    
    
      <cds-breadcrumb-item>
    
        
          <cds-breadcrumb-link href="#" size="MEDIUM">
    
            Home
          
  </cds-breadcrumb-link>
        
      
  </cds-breadcrumb-item>
    
      <cds-breadcrumb-item>
    
        
          <cds-breadcrumb-link href="#" size="MEDIUM">
    
            Docs
          
  </cds-breadcrumb-link>
        
      
  </cds-breadcrumb-item>
    
      <cds-breadcrumb-item>
    
        
          Breadcrumb
        
      
  </cds-breadcrumb-item>
    

  </cds-breadcrumb>
  ```


  ### `button`

  #### basic

  ##### primary

  ```heex
  <.button >
    Primary
  </.button>
  ```

  ```html
  <cds-button kind="primary" link-role="button" size="lg" tab-index="0" tooltip-alignment="" tooltip-position="top" type="button" id="basic-single-primary">
    
    Primary

    
  </cds-button>
  ```

  ##### group: kinds

  ```heex
  <.button kind="secondary">
    Secondary
  </.button>
  <.button kind="tertiary">
    Tertiary
  </.button>
  <.button kind="ghost">
    Ghost
  </.button>
  <.button kind="danger">
    Danger
  </.button>
  ```

  ```html
  <cds-button kind="secondary" link-role="button" size="lg" tab-index="0" tooltip-alignment="" tooltip-position="top" type="button" id="basic-kinds-secondary">
    
    Secondary

    
  </cds-button>
  <cds-button kind="tertiary" link-role="button" size="lg" tab-index="0" tooltip-alignment="" tooltip-position="top" type="button" id="basic-kinds-tertiary">
    
    Tertiary

    
  </cds-button>
  <cds-button kind="ghost" link-role="button" size="lg" tab-index="0" tooltip-alignment="" tooltip-position="top" type="button" id="basic-kinds-ghost">
    
    Ghost

    
  </cds-button>
  <cds-button kind="danger" link-role="button" size="lg" tab-index="0" tooltip-alignment="" tooltip-position="top" type="button" id="basic-kinds-danger">
    
    Danger

    
  </cds-button>
  ```

  ##### group: sizes

  ```heex
  <.button size="sm">
    Size sm
  </.button>
  <.button size="md">
    Size md
  </.button>
  <.button size="lg">
    Size lg
  </.button>
  ```

  ```html
  <cds-button kind="primary" link-role="button" size="sm" tab-index="0" tooltip-alignment="" tooltip-position="top" type="button" id="basic-sizes-sm">
    
    Size sm

    
  </cds-button>
  <cds-button kind="primary" link-role="button" size="md" tab-index="0" tooltip-alignment="" tooltip-position="top" type="button" id="basic-sizes-md">
    
    Size md

    
  </cds-button>
  <cds-button kind="primary" link-role="button" size="lg" tab-index="0" tooltip-alignment="" tooltip-position="top" type="button" id="basic-sizes-lg">
    
    Size lg

    
  </cds-button>
  ```

  ##### disabled

  ```heex
  <.button disabled>
    Disabled
  </.button>
  ```

  ```html
  <cds-button disabled kind="primary" link-role="button" size="lg" tab-index="0" tooltip-alignment="" tooltip-position="top" type="button" id="basic-single-disabled">
    
    Disabled

    
  </cds-button>
  ```


  ### `callout_notification`

  #### notification/callout

  ##### warning

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

  ##### success

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

  ##### error

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


  ### `carbon_link`

  #### link

  ##### inline

  ```heex
  <.carbon_link href="#">
    Inline link
  </.carbon_link>
  ```

  ```html
  <cds-link href="#" size="MEDIUM" id="link-single-inline">
    
    Inline link

  </cds-link>
  ```

  ##### external

  ```heex
  <.carbon_link target="_blank" rel="noreferrer" href="#">
    External link
  </.carbon_link>
  ```

  ```html
  <cds-link href="#" rel="noreferrer" size="MEDIUM" target="_blank" id="link-single-external">
    
    External link

  </cds-link>
  ```

  ##### disabled

  ```heex
  <.carbon_link disabled href="#">
    Disabled link
  </.carbon_link>
  ```

  ```html
  <cds-link disabled href="#" size="MEDIUM" id="link-single-disabled">
    
    Disabled link

  </cds-link>
  ```


  ### `chat_button`

  ##### default

  ```heex
  <.chat_button >
    Start chat
  </.chat_button>
  ```

  ```html
  <cds-chat-button kind="primary" size="lg" id="chat-button-single-default">
    
    Start chat

  </cds-chat-button>
  ```

  ##### quick_action

  ```heex
  <.chat_button is_quick_action>
    Quick action
  </.chat_button>
  ```

  ```html
  <cds-chat-button is-quick-action kind="primary" size="lg" id="chat-button-single-quick-action">
    
    Quick action

  </cds-chat-button>
  ```

  ##### selected

  ```heex
  <.chat_button is_selected is_quick_action>
    Selected
  </.chat_button>
  ```

  ```html
  <cds-chat-button is-quick-action is-selected kind="primary" size="lg" id="chat-button-single-selected">
    
    Selected

  </cds-chat-button>
  ```

  ##### group: sizes

  ```heex
  <.chat_button size="sm">
    Chat button
  </.chat_button>
  <.chat_button size="md">
    Chat button
  </.chat_button>
  <.chat_button size="lg">
    Chat button
  </.chat_button>
  ```

  ```html
  <cds-chat-button kind="primary" size="sm" id="chat-button-sizes-sm">
    
    Chat button

  </cds-chat-button>
  <cds-chat-button kind="primary" size="md" id="chat-button-sizes-md">
    
    Chat button

  </cds-chat-button>
  <cds-chat-button kind="primary" size="lg" id="chat-button-sizes-lg">
    
    Chat button

  </cds-chat-button>
  ```


  ### `checkbox_group`

  #### checkbox/basic

  ##### default

  ```heex
  <.checkbox_group legend_text="Notifications">
    <:item label="Email" value="email" />
    <:item label="SMS" value="sms" />
  </.checkbox_group>
  ```

  ```html
  <cds-checkbox-group legend-text="Notifications" orientation="vertical" id="basic-single-default">
    
    
      <cds-checkbox id="checkbox" label-text="Email" value="email">
    
  </cds-checkbox>
    
      <cds-checkbox id="checkbox" label-text="SMS" value="sms">
    
  </cds-checkbox>
    

  </cds-checkbox-group>
  ```

  ##### with_checked

  ```heex
  <.checkbox_group legend_text="Status">
    <:item label="Active" value="active" checked={true} />
    <:item label="Paused" value="paused" />
  </.checkbox_group>
  ```

  ```html
  <cds-checkbox-group legend-text="Status" orientation="vertical" id="basic-single-with-checked">
    
    
      <cds-checkbox checked id="checkbox" label-text="Active" value="active">
    
  </cds-checkbox>
    
      <cds-checkbox id="checkbox" label-text="Paused" value="paused">
    
  </cds-checkbox>
    

  </cds-checkbox-group>
  ```

  ##### invalid

  ```heex
  <.checkbox_group invalid invalid_text="Select at least one" legend_text="Required">
    <:item label="Option A" value="a" />
    <:item label="Option B" value="b" />
  </.checkbox_group>
  ```

  ```html
  <cds-checkbox-group invalid invalid-text="Select at least one" legend-text="Required" orientation="vertical" id="basic-single-invalid">
    
    
      <cds-checkbox id="checkbox" label-text="Option A" value="a">
    
  </cds-checkbox>
    
      <cds-checkbox id="checkbox" label-text="Option B" value="b">
    
  </cds-checkbox>
    

  </cds-checkbox-group>
  ```


  ### `code_snippet`

  ##### single

  ```heex
  <.code_snippet type="single">
    npm install graphene
  </.code_snippet>
  ```

  ```html
  <cds-code-snippet feedback="Copied!" feedback-timeout="2000" maxCollapsedNumberOfRows="15" maxExpandedNumberOfRows="0" minCollapsedNumberOfRows="3" minExpandedNumberOfRows="16" show-less-text="Show less" show-more-text="Show more" tooltip-content="Copy to clipboard" type="single" id="code-snippet-single-single">
    
    npm install graphene

  </cds-code-snippet>
  ```

  ##### inline

  ```heex
  <.code_snippet type="inline">
    mix test
  </.code_snippet>
  ```

  ```html
  <cds-code-snippet feedback="Copied!" feedback-timeout="2000" maxCollapsedNumberOfRows="15" maxExpandedNumberOfRows="0" minCollapsedNumberOfRows="3" minExpandedNumberOfRows="16" show-less-text="Show less" show-more-text="Show more" tooltip-content="Copy to clipboard" type="inline" id="code-snippet-single-inline">
    
    mix test

  </cds-code-snippet>
  ```

  ##### multi

  ```heex
  <.code_snippet type="multi">
    mix graphene.core_components.generate
    mix graphene.stories.generate
  </.code_snippet>
  ```

  ```html
  <cds-code-snippet feedback="Copied!" feedback-timeout="2000" maxCollapsedNumberOfRows="15" maxExpandedNumberOfRows="0" minCollapsedNumberOfRows="3" minExpandedNumberOfRows="16" show-less-text="Show less" show-more-text="Show more" tooltip-content="Copy to clipboard" type="multi" id="code-snippet-single-multi">
    
    mix graphene.core_components.generate
  mix graphene.stories.generate

  </cds-code-snippet>
  ```

  ##### wrapped

  ```heex
  <.code_snippet type="single" wrap_text>
    npm install graphene --save
  </.code_snippet>
  ```

  ```html
  <cds-code-snippet feedback="Copied!" feedback-timeout="2000" maxCollapsedNumberOfRows="15" maxExpandedNumberOfRows="0" minCollapsedNumberOfRows="3" minExpandedNumberOfRows="16" show-less-text="Show less" show-more-text="Show more" tooltip-content="Copy to clipboard" type="single" wrap-text id="code-snippet-single-wrapped">
    
    npm install graphene --save

  </cds-code-snippet>
  ```


  ### `combo_box`

  #### basic

  ##### default

  ```heex
  <.combo_box label="Combo box" name="combo-box-default" title_text="Choose an option">
    <:item value="all">All</:item>
    <:item value="cloud">Cloud</:item>
    <:item value="edge">Edge</:item>
  </.combo_box>
  ```

  ```html
  <input type="hidden" id="combo-box-default-input" name="combo-box-default" value="">
  <cds-combo-box clear-selection-label="Clear selection" direction="bottom" label="Combo box" name="combo-box-default" required-validity-message="Please fill out this field." size="md" title-text="Choose an option" type="" id="basic-single-default" data-form-detail="checked" data-form-event="cds-combo-box-selected" data-form-input="combo-box-default-input" data-form-mode="value" phx-hook="Graphene.FormComponents.GrapheneFormBridge">
    
    
    
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

  ##### inline

  ```heex
  <.combo_box label="Inline" name="combo-box-inline" type="inline" title_text="Inline combo">
    <:item value="ibm">IBM</:item>
    <:item value="redhat">Red Hat</:item>
    <:item value="hashicorp">HashiCorp</:item>
  </.combo_box>
  ```

  ```html
  <input type="hidden" id="combo-box-inline-input" name="combo-box-inline" value="">
  <cds-combo-box clear-selection-label="Clear selection" direction="bottom" label="Inline" name="combo-box-inline" required-validity-message="Please fill out this field." size="md" title-text="Inline combo" type="inline" id="basic-single-inline" data-form-detail="checked" data-form-event="cds-combo-box-selected" data-form-input="combo-box-inline-input" data-form-mode="value" phx-hook="Graphene.FormComponents.GrapheneFormBridge">
    
    
    
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

  ##### group: sizes

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
  <cds-combo-box clear-selection-label="Clear selection" direction="bottom" label="SM" name="combo-box-sm" required-validity-message="Please fill out this field." size="sm" title-text="Size sm" type="" id="basic-sizes-sm" data-form-detail="checked" data-form-event="cds-combo-box-selected" data-form-input="combo-box-sm-input" data-form-mode="value" phx-hook="Graphene.FormComponents.GrapheneFormBridge">
    
    
    
      <cds-combo-box-item size="md" value="one">
    
        One
      
  </cds-combo-box-item>
    
      <cds-combo-box-item size="md" value="two">
    
        Two
      
  </cds-combo-box-item>
    

    

  </cds-combo-box>

  <input type="hidden" id="combo-box-md-input" name="combo-box-md" value="">
  <cds-combo-box clear-selection-label="Clear selection" direction="bottom" label="MD" name="combo-box-md" required-validity-message="Please fill out this field." size="md" title-text="Size md" type="" id="basic-sizes-md" data-form-detail="checked" data-form-event="cds-combo-box-selected" data-form-input="combo-box-md-input" data-form-mode="value" phx-hook="Graphene.FormComponents.GrapheneFormBridge">
    
    
    
      <cds-combo-box-item size="md" value="one">
    
        One
      
  </cds-combo-box-item>
    
      <cds-combo-box-item size="md" value="two">
    
        Two
      
  </cds-combo-box-item>
    

    

  </cds-combo-box>

  <input type="hidden" id="combo-box-lg-input" name="combo-box-lg" value="">
  <cds-combo-box clear-selection-label="Clear selection" direction="bottom" label="LG" name="combo-box-lg" required-validity-message="Please fill out this field." size="lg" title-text="Size lg" type="" id="basic-sizes-lg" data-form-detail="checked" data-form-event="cds-combo-box-selected" data-form-input="combo-box-lg-input" data-form-mode="value" phx-hook="Graphene.FormComponents.GrapheneFormBridge">
    
    
    
      <cds-combo-box-item size="md" value="one">
    
        One
      
  </cds-combo-box-item>
    
      <cds-combo-box-item size="md" value="two">
    
        Two
      
  </cds-combo-box-item>
    

    

  </cds-combo-box>
  ```


  ### `combo_button`

  ##### default

  ```heex
  <.combo_button label="Primary action" size="lg">
    <:item label="Second action" />
    <:item label="Third action" />
    <:item label="Danger action" divider kind="danger" />
  </.combo_button>
  ```

  ```html
  <cds-combo-button label="Primary action" menu-alignment="top" size="lg" tooltip-alignment="top" tooltip-content="Additional actions" id="combo-button-single-default">
    
    <cds-menu>
    
      

    
    <cds-menu-item label="Second action">
    
      
    
    
  </cds-menu-item>

    
    <cds-menu-item label="Third action">
    
      
    
    
  </cds-menu-item>

    
      <cds-menu-item-divider>
    
  </cds-menu-item-divider>
    
    <cds-menu-item kind="danger" label="Danger action">
    
      
    
    
  </cds-menu-item>


    
  </cds-menu>

  </cds-combo-button>
  ```

  ##### small

  ```heex
  <.combo_button label="Small combo" size="sm">
    <:item label="Secondary" />
    <:item label="Tertiary" />
  </.combo_button>
  ```

  ```html
  <cds-combo-button label="Small combo" menu-alignment="top" size="sm" tooltip-alignment="top" tooltip-content="Additional actions" id="combo-button-single-small">
    
    <cds-menu>
    
      

    
    <cds-menu-item label="Secondary">
    
      
    
    
  </cds-menu-item>

    
    <cds-menu-item label="Tertiary">
    
      
    
    
  </cds-menu-item>


    
  </cds-menu>

  </cds-combo-button>
  ```

  ##### disabled

  ```heex
  <.combo_button disabled label="Disabled">
    <:item label="Secondary" />
    <:item label="Tertiary" />
  </.combo_button>
  ```

  ```html
  <cds-combo-button disabled label="Disabled" menu-alignment="top" size="lg" tooltip-alignment="top" tooltip-content="Additional actions" id="combo-button-single-disabled">
    
    <cds-menu>
    
      

    
    <cds-menu-item label="Secondary">
    
      
    
    
  </cds-menu-item>

    
    <cds-menu-item label="Tertiary">
    
      
    
    
  </cds-menu-item>


    
  </cds-menu>

  </cds-combo-button>
  ```


  ### `contained_list`

  #### basic

  ##### default

  ```heex
  <.contained_list >
    <:label>Contained list</:label>
    <:item>First item</:item>
    <:item>Second item</:item>
    <:item>Third item</:item>
  </.contained_list>
  ```

  ```html
  <cds-contained-list id="basic-single-default">
    
    <div slot="label">
      Contained list
    </div>
    
    
      <cds-contained-list-item>
    
        First item
      
    
    
  </cds-contained-list-item>
    
      <cds-contained-list-item>
    
        Second item
      
    
    
  </cds-contained-list-item>
    
      <cds-contained-list-item>
    
        Third item
      
    
    
  </cds-contained-list-item>
    

    
    
  </cds-contained-list>
  ```

  ##### interactive

  ```heex
  <.contained_list >
    <:label>Clickable list</:label>
    <:item clickable={true}>Clickable item</:item>
    <:item clickable={true}>Another action</:item>
    <:item disabled={true}>Disabled</:item>
  </.contained_list>
  ```

  ```html
  <cds-contained-list id="basic-single-interactive">
    
    <div slot="label">
      Clickable list
    </div>
    
    
      <cds-contained-list-item clickable>
    
        Clickable item
      
    
    
  </cds-contained-list-item>
    
      <cds-contained-list-item clickable>
    
        Another action
      
    
    
  </cds-contained-list-item>
    
      <cds-contained-list-item disabled>
    
        Disabled
      
    
    
  </cds-contained-list-item>
    

    
    
  </cds-contained-list>
  ```

  ##### group: sizes

  ```heex
  <.contained_list size="sm">
    <:label>Size sm</:label>
    <:item>Alpha</:item>
    <:item>Beta</:item>
  </.contained_list>
  <.contained_list size="md">
    <:label>Size md</:label>
    <:item>Alpha</:item>
    <:item>Beta</:item>
  </.contained_list>
  <.contained_list size="lg">
    <:label>Size lg</:label>
    <:item>Alpha</:item>
    <:item>Beta</:item>
  </.contained_list>
  ```

  ```html
  <cds-contained-list size="sm" id="basic-sizes-sm">
    
    <div slot="label">
      Size sm
    </div>
    
    
      <cds-contained-list-item>
    
        Alpha
      
    
    
  </cds-contained-list-item>
    
      <cds-contained-list-item>
    
        Beta
      
    
    
  </cds-contained-list-item>
    

    
    
  </cds-contained-list>
  <cds-contained-list size="md" id="basic-sizes-md">
    
    <div slot="label">
      Size md
    </div>
    
    
      <cds-contained-list-item>
    
        Alpha
      
    
    
  </cds-contained-list-item>
    
      <cds-contained-list-item>
    
        Beta
      
    
    
  </cds-contained-list-item>
    

    
    
  </cds-contained-list>
  <cds-contained-list size="lg" id="basic-sizes-lg">
    
    <div slot="label">
      Size lg
    </div>
    
    
      <cds-contained-list-item>
    
        Alpha
      
    
    
  </cds-contained-list-item>
    
      <cds-contained-list-item>
    
        Beta
      
    
    
  </cds-contained-list-item>
    

    
    
  </cds-contained-list>
  ```


  ### `content_switcher`

  #### basic

  ##### default

  ```heex
  <.content_switcher value="files">
    <:item value="files">Files</:item>
    <:item value="settings">Settings</:item>
  </.content_switcher>
  ```

  ```html
  <cds-content-switcher selected-index="0" selection-mode="automatic" value="files" id="basic-single-default">
    
    
      <cds-content-switcher-item align="top" close-on-activation value="files">
    
        Files
      
    
  </cds-content-switcher-item>
    
      <cds-content-switcher-item align="top" close-on-activation value="settings">
    
        Settings
      
    
  </cds-content-switcher-item>
    

  </cds-content-switcher>
  ```

  ##### low_contrast

  ```heex
  <.content_switcher value="tasks" low_contrast>
    <:item value="tasks">Tasks</:item>
    <:item value="insights">Insights</:item>
    <:item value="team">Team</:item>
  </.content_switcher>
  ```

  ```html
  <cds-content-switcher low-contrast selected-index="0" selection-mode="automatic" value="tasks" id="basic-single-low-contrast">
    
    
      <cds-content-switcher-item align="top" close-on-activation value="tasks">
    
        Tasks
      
    
  </cds-content-switcher-item>
    
      <cds-content-switcher-item align="top" close-on-activation value="insights">
    
        Insights
      
    
  </cds-content-switcher-item>
    
      <cds-content-switcher-item align="top" close-on-activation value="team">
    
        Team
      
    
  </cds-content-switcher-item>
    

  </cds-content-switcher>
  ```

  ##### group: sizes

  ```heex
  <.content_switcher size="sm" value="one">
    <:item value="one">One</:item>
    <:item value="two">Two</:item>
  </.content_switcher>
  <.content_switcher size="md" value="one">
    <:item value="one">One</:item>
    <:item value="two">Two</:item>
  </.content_switcher>
  <.content_switcher size="lg" value="one">
    <:item value="one">One</:item>
    <:item value="two">Two</:item>
  </.content_switcher>
  <.content_switcher size="xl" value="one">
    <:item value="one">One</:item>
    <:item value="two">Two</:item>
  </.content_switcher>
  ```

  ```html
  <cds-content-switcher selected-index="0" selection-mode="automatic" size="sm" value="one" id="basic-sizes-sm">
    
    
      <cds-content-switcher-item align="top" close-on-activation value="one">
    
        One
      
    
  </cds-content-switcher-item>
    
      <cds-content-switcher-item align="top" close-on-activation value="two">
    
        Two
      
    
  </cds-content-switcher-item>
    

  </cds-content-switcher>
  <cds-content-switcher selected-index="0" selection-mode="automatic" size="md" value="one" id="basic-sizes-md">
    
    
      <cds-content-switcher-item align="top" close-on-activation value="one">
    
        One
      
    
  </cds-content-switcher-item>
    
      <cds-content-switcher-item align="top" close-on-activation value="two">
    
        Two
      
    
  </cds-content-switcher-item>
    

  </cds-content-switcher>
  <cds-content-switcher selected-index="0" selection-mode="automatic" size="lg" value="one" id="basic-sizes-lg">
    
    
      <cds-content-switcher-item align="top" close-on-activation value="one">
    
        One
      
    
  </cds-content-switcher-item>
    
      <cds-content-switcher-item align="top" close-on-activation value="two">
    
        Two
      
    
  </cds-content-switcher-item>
    

  </cds-content-switcher>
  <cds-content-switcher selected-index="0" selection-mode="automatic" size="xl" value="one" id="basic-sizes-xl">
    
    
      <cds-content-switcher-item align="top" close-on-activation value="one">
    
        One
      
    
  </cds-content-switcher-item>
    
      <cds-content-switcher-item align="top" close-on-activation value="two">
    
        Two
      
    
  </cds-content-switcher-item>
    

  </cds-content-switcher>
  ```


  ### `copy_button`

  ##### default

  ```heex
  <.copy_button >
    Copy
  </.copy_button>
  ```

  ```html
  <cds-copy-button align="bottom" feedback="Copied!" feedback-timeout="2000" id="copy-button-single-default">
    
    Copy

  </cds-copy-button>
  ```

  ##### top_align

  ```heex
  <.copy_button align="top">
    Copy
  </.copy_button>
  ```

  ```html
  <cds-copy-button align="top" feedback="Copied!" feedback-timeout="2000" id="copy-button-single-top-align">
    
    Copy

  </cds-copy-button>
  ```

  ##### disabled

  ```heex
  <.copy_button disabled feedback="Copied">
    Copy
  </.copy_button>
  ```

  ```html
  <cds-copy-button align="bottom" disabled feedback="Copied" feedback-timeout="2000" id="copy-button-single-disabled">
    
    Copy

  </cds-copy-button>
  ```


  ### `data_table`

  #### ai_label

  ##### row_labels

  ```heex
  <.data_table
    id="ai-label-single-row-labels"
    rows={[%{id: 1, name: "Load Balancer 3", port: "3000", status: "Disabled", protocol: "HTTP", group: "Kevin's VM Groups", rule: "Round robin"}, %{id: 2, name: "Load Balancer 1", port: "443", status: "Starting", protocol: "HTTP", group: "Maureen's VM Groups", rule: "Round robin"}, %{id: 3, name: "Load Balancer 2", port: "80", status: "Active", protocol: "HTTP", group: "Andrew's VM Groups", rule: "DNS delegation"}, %{id: 4, name: "Load Balancer 6", port: "3000", status: "Disabled", protocol: "HTTP", group: "Marc's VM Groups", rule: "Round robin"}, %{id: 5, name: "Load Balancer 4", port: "443", status: "Starting", protocol: "HTTP", group: "Mel's VM Groups", rule: "Round robin"}, %{id: 6, name: "Load Balancer 5", port: "80", status: "Active", protocol: "HTTP", group: "Ronja's VM Groups", rule: "DNS delegation"}]}
    row_id={&Graphene.CarbonComponents.DataTable.Shared.row_id/1}
    with_row_ai_labels
  >
    <:title>DataTable</:title>
    <:description>AI labels</:description>
    <:row_decorator :let={row}>
      <%= if rem(row.id, 2) == 0 do %>
        <Storybook.CarbonComponents.DataTable.Shared.ai_label />
      <% end %>
    </:row_decorator>
    <:col :for={col <- Storybook.CarbonComponents.DataTable.Shared.columns()} :let={row} label={col.label}>
      <%= Map.get(row, col.key) %>
    </:col>
  </.data_table>
  ```

  ```html
  <div id="ai-label-single-row-labels-component">
    <cds-table headerCount="0" locale="en" size="lg" use-zebra-styles with-row-ai-labels id="ai-label-single-row-labels" phx-hook="BasicComponentsTable" data-selected-ids="" phx-target="1" phx-update="ignore">
    
      <cds-table-head>
    
        <cds-table-header-row>
    
          <cds-table-header-cell data-col-index="0">
    
            Name
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="1">
    
            Protocol
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="2">
    
            Port
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="3">
    
            Rule
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="4">
    
            Attached groups
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="5">
    
            Status
          
  </cds-table-header-cell>
          
        
  </cds-table-header-row>
      
  </cds-table-head>
      <cds-table-body id="ai-label-single-row-labelsbody">
    
        
          <cds-table-row id="1" data-row-id="1">
    
            
              
    

            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 3

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    3000

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Kevin&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Disabled

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row id="2" data-row-id="2">
    
            
              
    
      <cds-ai-label ai-text="AI" alignment="bottom-start" alignment-axis-offset="0" button-label="Show information" kind="" revert-label="Revert to AI input" size="xs" slot="ai-label">
    
    <div slot="body-text">
      
      <p class="secondary">AI Explained</p>
      <h2 class="ai-label-heading">84%</h2>
      <p class="secondary bold">Confidence score</p>
      <p class="secondary">Model type: Foundation</p>
    
    </div>
    
    
      <cds-ai-label-action-button kind="primary" link-role="button" size="lg" slot="actions" tab-index="0" tooltip-alignment="" tooltip-position="top" type="button">
    
        View literature
      
  </cds-ai-label-action-button>
    
    
    

    
    
  </cds-ai-label>
    

            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 1

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    443

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Maureen&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Starting

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row id="3" data-row-id="3">
    
            
              
    

            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 2

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    80

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    DNS delegation

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Andrew&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Active

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row id="4" data-row-id="4">
    
            
              
    
      <cds-ai-label ai-text="AI" alignment="bottom-start" alignment-axis-offset="0" button-label="Show information" kind="" revert-label="Revert to AI input" size="xs" slot="ai-label">
    
    <div slot="body-text">
      
      <p class="secondary">AI Explained</p>
      <h2 class="ai-label-heading">84%</h2>
      <p class="secondary bold">Confidence score</p>
      <p class="secondary">Model type: Foundation</p>
    
    </div>
    
    
      <cds-ai-label-action-button kind="primary" link-role="button" size="lg" slot="actions" tab-index="0" tooltip-alignment="" tooltip-position="top" type="button">
    
        View literature
      
  </cds-ai-label-action-button>
    
    
    

    
    
  </cds-ai-label>
    

            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 6

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    3000

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Marc&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Disabled

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row id="5" data-row-id="5">
    
            
              
    

            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 4

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    443

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Mel&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Starting

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row id="6" data-row-id="6">
    
            
              
    
      <cds-ai-label ai-text="AI" alignment="bottom-start" alignment-axis-offset="0" button-label="Show information" kind="" revert-label="Revert to AI input" size="xs" slot="ai-label">
    
    <div slot="body-text">
      
      <p class="secondary">AI Explained</p>
      <h2 class="ai-label-heading">84%</h2>
      <p class="secondary bold">Confidence score</p>
      <p class="secondary">Model type: Foundation</p>
    
    </div>
    
    
      <cds-ai-label-action-button kind="primary" link-role="button" size="lg" slot="actions" tab-index="0" tooltip-alignment="" tooltip-position="top" type="button">
    
        View literature
      
  </cds-ai-label-action-button>
    
    
    

    
    
  </cds-ai-label>
    

            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 5

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    80

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    DNS delegation

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Ronja&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Active

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
      
  </cds-table-body>
    
    <div slot="title">
      
        <cds-table-header-title>
    
          DataTable
        
  </cds-table-header-title>
      
    </div>
    <div slot="description">
      
        <cds-table-header-description>
    
          AI labels
        
  </cds-table-header-description>
      
    </div>
    
  </cds-table>
  </div>
  ```

  ##### compact

  ```heex
  <.data_table
    id="ai-label-single-compact"
    size="sm"
    rows={[%{id: 1, name: "Load Balancer 3", port: "3000", status: "Disabled", protocol: "HTTP", group: "Kevin's VM Groups", rule: "Round robin"}, %{id: 2, name: "Load Balancer 1", port: "443", status: "Starting", protocol: "HTTP", group: "Maureen's VM Groups", rule: "Round robin"}, %{id: 3, name: "Load Balancer 2", port: "80", status: "Active", protocol: "HTTP", group: "Andrew's VM Groups", rule: "DNS delegation"}, %{id: 4, name: "Load Balancer 6", port: "3000", status: "Disabled", protocol: "HTTP", group: "Marc's VM Groups", rule: "Round robin"}, %{id: 5, name: "Load Balancer 4", port: "443", status: "Starting", protocol: "HTTP", group: "Mel's VM Groups", rule: "Round robin"}, %{id: 6, name: "Load Balancer 5", port: "80", status: "Active", protocol: "HTTP", group: "Ronja's VM Groups", rule: "DNS delegation"}]}
    row_id={&Graphene.CarbonComponents.DataTable.Shared.row_id/1}
    with_row_ai_labels
  >
    <:title>DataTable</:title>
    <:description>Compact AI labels</:description>
    <:row_decorator :let={row}>
      <%= if rem(row.id, 2) == 0 do %>
        <Storybook.CarbonComponents.DataTable.Shared.ai_label />
      <% end %>
    </:row_decorator>
    <:col :for={col <- Storybook.CarbonComponents.DataTable.Shared.columns()} :let={row} label={col.label}>
      <%= Map.get(row, col.key) %>
    </:col>
  </.data_table>
  ```

  ```html
  <div id="ai-label-single-compact-component">
    <cds-table headerCount="0" locale="en" size="sm" use-zebra-styles with-row-ai-labels id="ai-label-single-compact" phx-hook="BasicComponentsTable" data-selected-ids="" phx-target="1" phx-update="ignore">
    
      <cds-table-head>
    
        <cds-table-header-row>
    
          <cds-table-header-cell data-col-index="0">
    
            Name
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="1">
    
            Protocol
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="2">
    
            Port
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="3">
    
            Rule
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="4">
    
            Attached groups
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="5">
    
            Status
          
  </cds-table-header-cell>
          
        
  </cds-table-header-row>
      
  </cds-table-head>
      <cds-table-body id="ai-label-single-compactbody">
    
        
          <cds-table-row id="1" data-row-id="1">
    
            
              
    

            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 3

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    3000

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Kevin&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Disabled

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row id="2" data-row-id="2">
    
            
              
    
      <cds-ai-label ai-text="AI" alignment="bottom-start" alignment-axis-offset="0" button-label="Show information" kind="" revert-label="Revert to AI input" size="xs" slot="ai-label">
    
    <div slot="body-text">
      
      <p class="secondary">AI Explained</p>
      <h2 class="ai-label-heading">84%</h2>
      <p class="secondary bold">Confidence score</p>
      <p class="secondary">Model type: Foundation</p>
    
    </div>
    
    
      <cds-ai-label-action-button kind="primary" link-role="button" size="lg" slot="actions" tab-index="0" tooltip-alignment="" tooltip-position="top" type="button">
    
        View literature
      
  </cds-ai-label-action-button>
    
    
    

    
    
  </cds-ai-label>
    

            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 1

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    443

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Maureen&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Starting

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row id="3" data-row-id="3">
    
            
              
    

            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 2

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    80

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    DNS delegation

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Andrew&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Active

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row id="4" data-row-id="4">
    
            
              
    
      <cds-ai-label ai-text="AI" alignment="bottom-start" alignment-axis-offset="0" button-label="Show information" kind="" revert-label="Revert to AI input" size="xs" slot="ai-label">
    
    <div slot="body-text">
      
      <p class="secondary">AI Explained</p>
      <h2 class="ai-label-heading">84%</h2>
      <p class="secondary bold">Confidence score</p>
      <p class="secondary">Model type: Foundation</p>
    
    </div>
    
    
      <cds-ai-label-action-button kind="primary" link-role="button" size="lg" slot="actions" tab-index="0" tooltip-alignment="" tooltip-position="top" type="button">
    
        View literature
      
  </cds-ai-label-action-button>
    
    
    

    
    
  </cds-ai-label>
    

            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 6

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    3000

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Marc&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Disabled

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row id="5" data-row-id="5">
    
            
              
    

            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 4

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    443

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Mel&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Starting

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row id="6" data-row-id="6">
    
            
              
    
      <cds-ai-label ai-text="AI" alignment="bottom-start" alignment-axis-offset="0" button-label="Show information" kind="" revert-label="Revert to AI input" size="xs" slot="ai-label">
    
    <div slot="body-text">
      
      <p class="secondary">AI Explained</p>
      <h2 class="ai-label-heading">84%</h2>
      <p class="secondary bold">Confidence score</p>
      <p class="secondary">Model type: Foundation</p>
    
    </div>
    
    
      <cds-ai-label-action-button kind="primary" link-role="button" size="lg" slot="actions" tab-index="0" tooltip-alignment="" tooltip-position="top" type="button">
    
        View literature
      
  </cds-ai-label-action-button>
    
    
    

    
    
  </cds-ai-label>
    

            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 5

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    80

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    DNS delegation

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Ronja&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Active

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
      
  </cds-table-body>
    
    <div slot="title">
      
        <cds-table-header-title>
    
          DataTable
        
  </cds-table-header-title>
      
    </div>
    <div slot="description">
      
        <cds-table-header-description>
    
          Compact AI labels
        
  </cds-table-header-description>
      
    </div>
    
  </cds-table>
  </div>
  ```


  #### ai_label_expansion

  ##### ai_expand

  ```heex
  <.data_table
    id="ai-label-expansion-single-ai-expand"
    rows={[%{id: 1, name: "Load Balancer 3", port: "3000", status: "Disabled", protocol: "HTTP", group: "Kevin's VM Groups", rule: "Round robin"}, %{id: 2, name: "Load Balancer 1", port: "443", status: "Starting", protocol: "HTTP", group: "Maureen's VM Groups", rule: "Round robin"}, %{id: 3, name: "Load Balancer 2", port: "80", status: "Active", protocol: "HTTP", group: "Andrew's VM Groups", rule: "DNS delegation"}, %{id: 4, name: "Load Balancer 6", port: "3000", status: "Disabled", protocol: "HTTP", group: "Marc's VM Groups", rule: "Round robin"}, %{id: 5, name: "Load Balancer 4", port: "443", status: "Starting", protocol: "HTTP", group: "Mel's VM Groups", rule: "Round robin"}, %{id: 6, name: "Load Balancer 5", port: "80", status: "Active", protocol: "HTTP", group: "Ronja's VM Groups", rule: "DNS delegation"}]}
    row_id={&Graphene.CarbonComponents.DataTable.Shared.row_id/1}
    with_row_ai_labels
    batch_expansion
    expandable
  >
    <:title>DataTable</:title>
    <:description>AI labels with expansion</:description>
    <:row_decorator :let={row}>
      <%= if rem(row.id, 2) == 0 do %>
        <Storybook.CarbonComponents.DataTable.Shared.ai_label />
      <% end %>
    </:row_decorator>
    <:col :for={col <- Storybook.CarbonComponents.DataTable.Shared.columns()} :let={row} label={col.label}>
      <%= Map.get(row, col.key) %>
    </:col>
    <:expanded_row :let={row}>
      <h6>Expandable row content</h6>
      <div><%= Storybook.CarbonComponents.DataTable.Shared.expanded_content(row) %></div>
    </:expanded_row>
  </.data_table>
  ```

  ```html
  <div id="ai-label-expansion-single-ai-expand-component">
    <cds-table batch-expansion expandable headerCount="0" locale="en" size="lg" use-zebra-styles with-row-ai-labels id="ai-label-expansion-single-ai-expand" phx-hook="BasicComponentsTable" data-selected-ids="" phx-target="1" phx-update="ignore">
    
      <cds-table-head>
    
        <cds-table-header-row batch-expansion>
    
          <cds-table-header-cell data-col-index="0">
    
            Name
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="1">
    
            Protocol
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="2">
    
            Port
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="3">
    
            Rule
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="4">
    
            Attached groups
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="5">
    
            Status
          
  </cds-table-header-cell>
          
        
  </cds-table-header-row>
      
  </cds-table-head>
      <cds-table-body id="ai-label-expansion-single-ai-expandbody">
    
        
          <cds-table-row batch-expansion id="1" data-row-id="1">
    
            
              
    

            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 3

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    3000

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Kevin&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Disabled

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          <cds-table-expanded-row colspan="1">
    
            
              
    <h6>Expandable row content</h6>
    <div>Expandable content for Load Balancer 3</div>

            
          
  </cds-table-expanded-row>
        
          <cds-table-row batch-expansion id="2" data-row-id="2">
    
            
              
    
      <cds-ai-label ai-text="AI" alignment="bottom-start" alignment-axis-offset="0" button-label="Show information" kind="" revert-label="Revert to AI input" size="xs" slot="ai-label">
    
    <div slot="body-text">
      
      <p class="secondary">AI Explained</p>
      <h2 class="ai-label-heading">84%</h2>
      <p class="secondary bold">Confidence score</p>
      <p class="secondary">Model type: Foundation</p>
    
    </div>
    
    
      <cds-ai-label-action-button kind="primary" link-role="button" size="lg" slot="actions" tab-index="0" tooltip-alignment="" tooltip-position="top" type="button">
    
        View literature
      
  </cds-ai-label-action-button>
    
    
    

    
    
  </cds-ai-label>
    

            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 1

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    443

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Maureen&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Starting

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          <cds-table-expanded-row colspan="1">
    
            
              
    <h6>Expandable row content</h6>
    <div>Expandable content for Load Balancer 1</div>

            
          
  </cds-table-expanded-row>
        
          <cds-table-row batch-expansion id="3" data-row-id="3">
    
            
              
    

            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 2

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    80

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    DNS delegation

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Andrew&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Active

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          <cds-table-expanded-row colspan="1">
    
            
              
    <h6>Expandable row content</h6>
    <div>Expandable content for Load Balancer 2</div>

            
          
  </cds-table-expanded-row>
        
          <cds-table-row batch-expansion id="4" data-row-id="4">
    
            
              
    
      <cds-ai-label ai-text="AI" alignment="bottom-start" alignment-axis-offset="0" button-label="Show information" kind="" revert-label="Revert to AI input" size="xs" slot="ai-label">
    
    <div slot="body-text">
      
      <p class="secondary">AI Explained</p>
      <h2 class="ai-label-heading">84%</h2>
      <p class="secondary bold">Confidence score</p>
      <p class="secondary">Model type: Foundation</p>
    
    </div>
    
    
      <cds-ai-label-action-button kind="primary" link-role="button" size="lg" slot="actions" tab-index="0" tooltip-alignment="" tooltip-position="top" type="button">
    
        View literature
      
  </cds-ai-label-action-button>
    
    
    

    
    
  </cds-ai-label>
    

            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 6

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    3000

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Marc&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Disabled

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          <cds-table-expanded-row colspan="1">
    
            
              
    <h6>Expandable row content</h6>
    <div>Expandable content for Load Balancer 6</div>

            
          
  </cds-table-expanded-row>
        
          <cds-table-row batch-expansion id="5" data-row-id="5">
    
            
              
    

            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 4

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    443

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Mel&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Starting

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          <cds-table-expanded-row colspan="1">
    
            
              
    <h6>Expandable row content</h6>
    <div>Expandable content for Load Balancer 4</div>

            
          
  </cds-table-expanded-row>
        
          <cds-table-row batch-expansion id="6" data-row-id="6">
    
            
              
    
      <cds-ai-label ai-text="AI" alignment="bottom-start" alignment-axis-offset="0" button-label="Show information" kind="" revert-label="Revert to AI input" size="xs" slot="ai-label">
    
    <div slot="body-text">
      
      <p class="secondary">AI Explained</p>
      <h2 class="ai-label-heading">84%</h2>
      <p class="secondary bold">Confidence score</p>
      <p class="secondary">Model type: Foundation</p>
    
    </div>
    
    
      <cds-ai-label-action-button kind="primary" link-role="button" size="lg" slot="actions" tab-index="0" tooltip-alignment="" tooltip-position="top" type="button">
    
        View literature
      
  </cds-ai-label-action-button>
    
    
    

    
    
  </cds-ai-label>
    

            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 5

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    80

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    DNS delegation

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Ronja&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Active

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          <cds-table-expanded-row colspan="1">
    
            
              
    <h6>Expandable row content</h6>
    <div>Expandable content for Load Balancer 5</div>

            
          
  </cds-table-expanded-row>
        
      
  </cds-table-body>
    
    <div slot="title">
      
        <cds-table-header-title>
    
          DataTable
        
  </cds-table-header-title>
      
    </div>
    <div slot="description">
      
        <cds-table-header-description>
    
          AI labels with expansion
        
  </cds-table-header-description>
      
    </div>
    
  </cds-table>
  </div>
  ```

  ##### compact

  ```heex
  <.data_table
    id="ai-label-expansion-single-compact"
    size="sm"
    rows={[%{id: 1, name: "Load Balancer 3", port: "3000", status: "Disabled", protocol: "HTTP", group: "Kevin's VM Groups", rule: "Round robin"}, %{id: 2, name: "Load Balancer 1", port: "443", status: "Starting", protocol: "HTTP", group: "Maureen's VM Groups", rule: "Round robin"}, %{id: 3, name: "Load Balancer 2", port: "80", status: "Active", protocol: "HTTP", group: "Andrew's VM Groups", rule: "DNS delegation"}, %{id: 4, name: "Load Balancer 6", port: "3000", status: "Disabled", protocol: "HTTP", group: "Marc's VM Groups", rule: "Round robin"}, %{id: 5, name: "Load Balancer 4", port: "443", status: "Starting", protocol: "HTTP", group: "Mel's VM Groups", rule: "Round robin"}, %{id: 6, name: "Load Balancer 5", port: "80", status: "Active", protocol: "HTTP", group: "Ronja's VM Groups", rule: "DNS delegation"}]}
    row_id={&Graphene.CarbonComponents.DataTable.Shared.row_id/1}
    with_row_ai_labels
    batch_expansion
    expandable
  >
    <:title>DataTable</:title>
    <:description>Compact AI expansion</:description>
    <:row_decorator :let={row}>
      <%= if rem(row.id, 2) == 0 do %>
        <Storybook.CarbonComponents.DataTable.Shared.ai_label />
      <% end %>
    </:row_decorator>
    <:col :for={col <- Storybook.CarbonComponents.DataTable.Shared.columns()} :let={row} label={col.label}>
      <%= Map.get(row, col.key) %>
    </:col>
    <:expanded_row :let={row}>
      <h6>Details</h6>
      <div><%= Storybook.CarbonComponents.DataTable.Shared.expanded_content(row) %></div>
    </:expanded_row>
  </.data_table>
  ```

  ```html
  <div id="ai-label-expansion-single-compact-component">
    <cds-table batch-expansion expandable headerCount="0" locale="en" size="sm" use-zebra-styles with-row-ai-labels id="ai-label-expansion-single-compact" phx-hook="BasicComponentsTable" data-selected-ids="" phx-target="1" phx-update="ignore">
    
      <cds-table-head>
    
        <cds-table-header-row batch-expansion>
    
          <cds-table-header-cell data-col-index="0">
    
            Name
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="1">
    
            Protocol
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="2">
    
            Port
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="3">
    
            Rule
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="4">
    
            Attached groups
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="5">
    
            Status
          
  </cds-table-header-cell>
          
        
  </cds-table-header-row>
      
  </cds-table-head>
      <cds-table-body id="ai-label-expansion-single-compactbody">
    
        
          <cds-table-row batch-expansion id="1" data-row-id="1">
    
            
              
    

            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 3

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    3000

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Kevin&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Disabled

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          <cds-table-expanded-row colspan="1">
    
            
              
    <h6>Details</h6>
    <div>Expandable content for Load Balancer 3</div>

            
          
  </cds-table-expanded-row>
        
          <cds-table-row batch-expansion id="2" data-row-id="2">
    
            
              
    
      <cds-ai-label ai-text="AI" alignment="bottom-start" alignment-axis-offset="0" button-label="Show information" kind="" revert-label="Revert to AI input" size="xs" slot="ai-label">
    
    <div slot="body-text">
      
      <p class="secondary">AI Explained</p>
      <h2 class="ai-label-heading">84%</h2>
      <p class="secondary bold">Confidence score</p>
      <p class="secondary">Model type: Foundation</p>
    
    </div>
    
    
      <cds-ai-label-action-button kind="primary" link-role="button" size="lg" slot="actions" tab-index="0" tooltip-alignment="" tooltip-position="top" type="button">
    
        View literature
      
  </cds-ai-label-action-button>
    
    
    

    
    
  </cds-ai-label>
    

            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 1

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    443

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Maureen&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Starting

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          <cds-table-expanded-row colspan="1">
    
            
              
    <h6>Details</h6>
    <div>Expandable content for Load Balancer 1</div>

            
          
  </cds-table-expanded-row>
        
          <cds-table-row batch-expansion id="3" data-row-id="3">
    
            
              
    

            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 2

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    80

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    DNS delegation

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Andrew&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Active

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          <cds-table-expanded-row colspan="1">
    
            
              
    <h6>Details</h6>
    <div>Expandable content for Load Balancer 2</div>

            
          
  </cds-table-expanded-row>
        
          <cds-table-row batch-expansion id="4" data-row-id="4">
    
            
              
    
      <cds-ai-label ai-text="AI" alignment="bottom-start" alignment-axis-offset="0" button-label="Show information" kind="" revert-label="Revert to AI input" size="xs" slot="ai-label">
    
    <div slot="body-text">
      
      <p class="secondary">AI Explained</p>
      <h2 class="ai-label-heading">84%</h2>
      <p class="secondary bold">Confidence score</p>
      <p class="secondary">Model type: Foundation</p>
    
    </div>
    
    
      <cds-ai-label-action-button kind="primary" link-role="button" size="lg" slot="actions" tab-index="0" tooltip-alignment="" tooltip-position="top" type="button">
    
        View literature
      
  </cds-ai-label-action-button>
    
    
    

    
    
  </cds-ai-label>
    

            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 6

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    3000

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Marc&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Disabled

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          <cds-table-expanded-row colspan="1">
    
            
              
    <h6>Details</h6>
    <div>Expandable content for Load Balancer 6</div>

            
          
  </cds-table-expanded-row>
        
          <cds-table-row batch-expansion id="5" data-row-id="5">
    
            
              
    

            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 4

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    443

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Mel&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Starting

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          <cds-table-expanded-row colspan="1">
    
            
              
    <h6>Details</h6>
    <div>Expandable content for Load Balancer 4</div>

            
          
  </cds-table-expanded-row>
        
          <cds-table-row batch-expansion id="6" data-row-id="6">
    
            
              
    
      <cds-ai-label ai-text="AI" alignment="bottom-start" alignment-axis-offset="0" button-label="Show information" kind="" revert-label="Revert to AI input" size="xs" slot="ai-label">
    
    <div slot="body-text">
      
      <p class="secondary">AI Explained</p>
      <h2 class="ai-label-heading">84%</h2>
      <p class="secondary bold">Confidence score</p>
      <p class="secondary">Model type: Foundation</p>
    
    </div>
    
    
      <cds-ai-label-action-button kind="primary" link-role="button" size="lg" slot="actions" tab-index="0" tooltip-alignment="" tooltip-position="top" type="button">
    
        View literature
      
  </cds-ai-label-action-button>
    
    
    

    
    
  </cds-ai-label>
    

            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 5

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    80

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    DNS delegation

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Ronja&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Active

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          <cds-table-expanded-row colspan="1">
    
            
              
    <h6>Details</h6>
    <div>Expandable content for Load Balancer 5</div>

            
          
  </cds-table-expanded-row>
        
      
  </cds-table-body>
    
    <div slot="title">
      
        <cds-table-header-title>
    
          DataTable
        
  </cds-table-header-title>
      
    </div>
    <div slot="description">
      
        <cds-table-header-description>
    
          Compact AI expansion
        
  </cds-table-header-description>
      
    </div>
    
  </cds-table>
  </div>
  ```


  #### ai_label_sort

  ##### sorting

  ```heex
  <.data_table
    id="ai-label-sort-single-sorting"
    rows={[%{id: 1, name: "Load Balancer 3", port: "3000", status: "Disabled", protocol: "HTTP", group: "Kevin's VM Groups", rule: "Round robin"}, %{id: 2, name: "Load Balancer 1", port: "443", status: "Starting", protocol: "HTTP", group: "Maureen's VM Groups", rule: "Round robin"}, %{id: 3, name: "Load Balancer 2", port: "80", status: "Active", protocol: "HTTP", group: "Andrew's VM Groups", rule: "DNS delegation"}, %{id: 4, name: "Load Balancer 6", port: "3000", status: "Disabled", protocol: "HTTP", group: "Marc's VM Groups", rule: "Round robin"}, %{id: 5, name: "Load Balancer 4", port: "443", status: "Starting", protocol: "HTTP", group: "Mel's VM Groups", rule: "Round robin"}, %{id: 6, name: "Load Balancer 5", port: "80", status: "Active", protocol: "HTTP", group: "Ronja's VM Groups", rule: "DNS delegation"}]}
    row_id={&Graphene.CarbonComponents.DataTable.Shared.row_id/1}
    sortable
  >
    <:title>DataTable</:title>
    <:description>AI label in header with sorting</:description>
    <:col label="Name" :let={row}><%= row.name %></:col>
    <:col label="Protocol" :let={row}><%= row.protocol %></:col>
    <:col label="Port" :let={row}><%= row.port %></:col>
    <:col label="Rule" :let={row}><%= row.rule %></:col>
    <:col label={fn -> Storybook.CarbonComponents.DataTable.Shared.ai_label_header(%{}) end} :let={row}><%= row.group %></:col>
    <:col label="Status" :let={row}><%= row.status %></:col>
  </.data_table>
  ```

  ```html
  <div id="ai-label-sort-single-sorting-component">
    <cds-table headerCount="0" is-sortable locale="en" size="lg" use-zebra-styles id="ai-label-sort-single-sorting" phx-hook="BasicComponentsTable" data-selected-ids="" phx-target="1" phx-update="ignore">
    
      <cds-table-head>
    
        <cds-table-header-row>
    
          <cds-table-header-cell is-sortable data-col-index="0">
    
            Name
          
  </cds-table-header-cell><cds-table-header-cell is-sortable data-col-index="1">
    
            Protocol
          
  </cds-table-header-cell><cds-table-header-cell is-sortable data-col-index="2">
    
            Port
          
  </cds-table-header-cell><cds-table-header-cell is-sortable data-col-index="3">
    
            Rule
          
  </cds-table-header-cell><cds-table-header-cell is-sortable data-col-index="4">
    
            <span>Attached groups</span>
  <cds-ai-label ai-text="AI" alignment="bottom-start" alignment-axis-offset="0" button-label="Show information" kind="inline" revert-label="Revert to AI input" size="xs" slot="ai-label">
    
    <div slot="body-text">
      
      <p class="secondary">AI Explained</p>
      <p class="secondary">Sorting guidance</p>
    
    </div>
    
    
      <cds-ai-label-action-button kind="primary" link-role="button" size="lg" slot="actions" tab-index="0" tooltip-alignment="" tooltip-position="top" type="button">
    
        View details
      
  </cds-ai-label-action-button>
    
    
    

    
    
  </cds-ai-label>
          
  </cds-table-header-cell><cds-table-header-cell is-sortable data-col-index="5">
    
            Status
          
  </cds-table-header-cell>
          
        
  </cds-table-header-row>
      
  </cds-table-head>
      <cds-table-body id="ai-label-sort-single-sortingbody">
    
        
          <cds-table-row id="1" data-row-id="1">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                Load Balancer 3
              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                HTTP
              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                3000
              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                Round robin
              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                Kevin&#39;s VM Groups
              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                Disabled
              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row id="2" data-row-id="2">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                Load Balancer 1
              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                HTTP
              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                443
              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                Round robin
              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                Maureen&#39;s VM Groups
              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                Starting
              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row id="3" data-row-id="3">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                Load Balancer 2
              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                HTTP
              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                80
              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                DNS delegation
              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                Andrew&#39;s VM Groups
              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                Active
              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row id="4" data-row-id="4">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                Load Balancer 6
              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                HTTP
              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                3000
              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                Round robin
              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                Marc&#39;s VM Groups
              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                Disabled
              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row id="5" data-row-id="5">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                Load Balancer 4
              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                HTTP
              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                443
              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                Round robin
              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                Mel&#39;s VM Groups
              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                Starting
              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row id="6" data-row-id="6">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                Load Balancer 5
              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                HTTP
              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                80
              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                DNS delegation
              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                Ronja&#39;s VM Groups
              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                Active
              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
      
  </cds-table-body>
    
    <div slot="title">
      
        <cds-table-header-title>
    
          DataTable
        
  </cds-table-header-title>
      
    </div>
    <div slot="description">
      
        <cds-table-header-description>
    
          AI label in header with sorting
        
  </cds-table-header-description>
      
    </div>
    
  </cds-table>
  </div>
  ```

  ##### compact

  ```heex
  <.data_table
    id="ai-label-sort-single-compact"
    size="sm"
    rows={[%{id: 1, name: "Load Balancer 3", port: "3000", status: "Disabled", protocol: "HTTP", group: "Kevin's VM Groups", rule: "Round robin"}, %{id: 2, name: "Load Balancer 1", port: "443", status: "Starting", protocol: "HTTP", group: "Maureen's VM Groups", rule: "Round robin"}, %{id: 3, name: "Load Balancer 2", port: "80", status: "Active", protocol: "HTTP", group: "Andrew's VM Groups", rule: "DNS delegation"}, %{id: 4, name: "Load Balancer 6", port: "3000", status: "Disabled", protocol: "HTTP", group: "Marc's VM Groups", rule: "Round robin"}, %{id: 5, name: "Load Balancer 4", port: "443", status: "Starting", protocol: "HTTP", group: "Mel's VM Groups", rule: "Round robin"}, %{id: 6, name: "Load Balancer 5", port: "80", status: "Active", protocol: "HTTP", group: "Ronja's VM Groups", rule: "DNS delegation"}]}
    row_id={&Graphene.CarbonComponents.DataTable.Shared.row_id/1}
    sortable
  >
    <:title>DataTable</:title>
    <:description>Compact AI label header</:description>
    <:col label="Name" :let={row}><%= row.name %></:col>
    <:col label="Protocol" :let={row}><%= row.protocol %></:col>
    <:col label="Port" :let={row}><%= row.port %></:col>
    <:col label="Rule" :let={row}><%= row.rule %></:col>
    <:col label={fn -> Storybook.CarbonComponents.DataTable.Shared.ai_label_header(%{}) end} :let={row}><%= row.group %></:col>
    <:col label="Status" :let={row}><%= row.status %></:col>
  </.data_table>
  ```

  ```html
  <div id="ai-label-sort-single-compact-component">
    <cds-table headerCount="0" is-sortable locale="en" size="sm" use-zebra-styles id="ai-label-sort-single-compact" phx-hook="BasicComponentsTable" data-selected-ids="" phx-target="1" phx-update="ignore">
    
      <cds-table-head>
    
        <cds-table-header-row>
    
          <cds-table-header-cell is-sortable data-col-index="0">
    
            Name
          
  </cds-table-header-cell><cds-table-header-cell is-sortable data-col-index="1">
    
            Protocol
          
  </cds-table-header-cell><cds-table-header-cell is-sortable data-col-index="2">
    
            Port
          
  </cds-table-header-cell><cds-table-header-cell is-sortable data-col-index="3">
    
            Rule
          
  </cds-table-header-cell><cds-table-header-cell is-sortable data-col-index="4">
    
            <span>Attached groups</span>
  <cds-ai-label ai-text="AI" alignment="bottom-start" alignment-axis-offset="0" button-label="Show information" kind="inline" revert-label="Revert to AI input" size="xs" slot="ai-label">
    
    <div slot="body-text">
      
      <p class="secondary">AI Explained</p>
      <p class="secondary">Sorting guidance</p>
    
    </div>
    
    
      <cds-ai-label-action-button kind="primary" link-role="button" size="lg" slot="actions" tab-index="0" tooltip-alignment="" tooltip-position="top" type="button">
    
        View details
      
  </cds-ai-label-action-button>
    
    
    

    
    
  </cds-ai-label>
          
  </cds-table-header-cell><cds-table-header-cell is-sortable data-col-index="5">
    
            Status
          
  </cds-table-header-cell>
          
        
  </cds-table-header-row>
      
  </cds-table-head>
      <cds-table-body id="ai-label-sort-single-compactbody">
    
        
          <cds-table-row id="1" data-row-id="1">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                Load Balancer 3
              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                HTTP
              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                3000
              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                Round robin
              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                Kevin&#39;s VM Groups
              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                Disabled
              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row id="2" data-row-id="2">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                Load Balancer 1
              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                HTTP
              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                443
              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                Round robin
              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                Maureen&#39;s VM Groups
              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                Starting
              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row id="3" data-row-id="3">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                Load Balancer 2
              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                HTTP
              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                80
              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                DNS delegation
              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                Andrew&#39;s VM Groups
              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                Active
              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row id="4" data-row-id="4">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                Load Balancer 6
              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                HTTP
              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                3000
              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                Round robin
              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                Marc&#39;s VM Groups
              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                Disabled
              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row id="5" data-row-id="5">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                Load Balancer 4
              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                HTTP
              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                443
              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                Round robin
              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                Mel&#39;s VM Groups
              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                Starting
              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row id="6" data-row-id="6">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                Load Balancer 5
              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                HTTP
              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                80
              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                DNS delegation
              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                Ronja&#39;s VM Groups
              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                Active
              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
      
  </cds-table-body>
    
    <div slot="title">
      
        <cds-table-header-title>
    
          DataTable
        
  </cds-table-header-title>
      
    </div>
    <div slot="description">
      
        <cds-table-header-description>
    
          Compact AI label header
        
  </cds-table-header-description>
      
    </div>
    
  </cds-table>
  </div>
  ```


  #### basic

  ##### default

  ```heex
  <.data_table
    id="basic-single-default"
    rows={[%{id: 1, name: "Load Balancer 3", port: "3000", status: "Disabled", protocol: "HTTP", group: "Kevin's VM Groups", rule: "Round robin"}, %{id: 2, name: "Load Balancer 1", port: "443", status: "Starting", protocol: "HTTP", group: "Maureen's VM Groups", rule: "Round robin"}, %{id: 3, name: "Load Balancer 2", port: "80", status: "Active", protocol: "HTTP", group: "Andrew's VM Groups", rule: "DNS delegation"}, %{id: 4, name: "Load Balancer 6", port: "3000", status: "Disabled", protocol: "HTTP", group: "Marc's VM Groups", rule: "Round robin"}, %{id: 5, name: "Load Balancer 4", port: "443", status: "Starting", protocol: "HTTP", group: "Mel's VM Groups", rule: "Round robin"}, %{id: 6, name: "Load Balancer 5", port: "80", status: "Active", protocol: "HTTP", group: "Ronja's VM Groups", rule: "DNS delegation"}]}
    row_id={&Graphene.CarbonComponents.DataTable.Shared.row_id/1}
  >
    <:title>DataTable</:title>
    <:description>Basic</:description>
    <:col :for={col <- Storybook.CarbonComponents.DataTable.Shared.columns()} :let={row} label={col.label}>
      <%= Map.get(row, col.key) %>
    </:col>
  </.data_table>
  ```

  ```html
  <div id="basic-single-default-component">
    <cds-table headerCount="0" locale="en" size="lg" use-zebra-styles id="basic-single-default" phx-hook="BasicComponentsTable" data-selected-ids="" phx-target="1" phx-update="ignore">
    
      <cds-table-head>
    
        <cds-table-header-row>
    
          <cds-table-header-cell data-col-index="0">
    
            Name
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="1">
    
            Protocol
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="2">
    
            Port
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="3">
    
            Rule
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="4">
    
            Attached groups
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="5">
    
            Status
          
  </cds-table-header-cell>
          
        
  </cds-table-header-row>
      
  </cds-table-head>
      <cds-table-body id="basic-single-defaultbody">
    
        
          <cds-table-row id="1" data-row-id="1">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 3

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    3000

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Kevin&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Disabled

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row id="2" data-row-id="2">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 1

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    443

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Maureen&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Starting

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row id="3" data-row-id="3">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 2

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    80

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    DNS delegation

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Andrew&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Active

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row id="4" data-row-id="4">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 6

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    3000

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Marc&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Disabled

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row id="5" data-row-id="5">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 4

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    443

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Mel&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Starting

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row id="6" data-row-id="6">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 5

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    80

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    DNS delegation

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Ronja&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Active

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
      
  </cds-table-body>
    
    <div slot="title">
      
        <cds-table-header-title>
    
          DataTable
        
  </cds-table-header-title>
      
    </div>
    <div slot="description">
      
        <cds-table-header-description>
    
          Basic
        
  </cds-table-header-description>
      
    </div>
    
  </cds-table>
  </div>
  ```

  ##### compact

  ```heex
  <.data_table
    id="basic-single-compact"
    size="sm"
    rows={[%{id: 1, name: "Load Balancer 3", port: "3000", status: "Disabled", protocol: "HTTP", group: "Kevin's VM Groups", rule: "Round robin"}, %{id: 2, name: "Load Balancer 1", port: "443", status: "Starting", protocol: "HTTP", group: "Maureen's VM Groups", rule: "Round robin"}, %{id: 3, name: "Load Balancer 2", port: "80", status: "Active", protocol: "HTTP", group: "Andrew's VM Groups", rule: "DNS delegation"}, %{id: 4, name: "Load Balancer 6", port: "3000", status: "Disabled", protocol: "HTTP", group: "Marc's VM Groups", rule: "Round robin"}, %{id: 5, name: "Load Balancer 4", port: "443", status: "Starting", protocol: "HTTP", group: "Mel's VM Groups", rule: "Round robin"}, %{id: 6, name: "Load Balancer 5", port: "80", status: "Active", protocol: "HTTP", group: "Ronja's VM Groups", rule: "DNS delegation"}]}
    row_id={&Graphene.CarbonComponents.DataTable.Shared.row_id/1}
  >
    <:title>DataTable</:title>
    <:description>Compact</:description>
    <:col :for={col <- Storybook.CarbonComponents.DataTable.Shared.columns()} :let={row} label={col.label}>
      <%= Map.get(row, col.key) %>
    </:col>
  </.data_table>
  ```

  ```html
  <div id="basic-single-compact-component">
    <cds-table headerCount="0" locale="en" size="sm" id="basic-single-compact" phx-hook="BasicComponentsTable" data-selected-ids="" phx-target="1" phx-update="ignore">
    
      <cds-table-head>
    
        <cds-table-header-row>
    
          <cds-table-header-cell data-col-index="0">
    
            Name
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="1">
    
            Protocol
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="2">
    
            Port
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="3">
    
            Rule
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="4">
    
            Attached groups
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="5">
    
            Status
          
  </cds-table-header-cell>
          
        
  </cds-table-header-row>
      
  </cds-table-head>
      <cds-table-body id="basic-single-compactbody">
    
        
          <cds-table-row id="1" data-row-id="1">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 3

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    3000

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Kevin&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Disabled

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row id="2" data-row-id="2">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 1

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    443

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Maureen&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Starting

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row id="3" data-row-id="3">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 2

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    80

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    DNS delegation

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Andrew&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Active

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row id="4" data-row-id="4">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 6

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    3000

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Marc&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Disabled

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row id="5" data-row-id="5">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 4

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    443

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Mel&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Starting

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row id="6" data-row-id="6">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 5

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    80

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    DNS delegation

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Ronja&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Active

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
      
  </cds-table-body>
    
    <div slot="title">
      
        <cds-table-header-title>
    
          DataTable
        
  </cds-table-header-title>
      
    </div>
    <div slot="description">
      
        <cds-table-header-description>
    
          Compact
        
  </cds-table-header-description>
      
    </div>
    
  </cds-table>
  </div>
  ```


  #### batch_actions

  ##### batch_actions

  ```heex
  <.data_table
    id="batch-actions-single-batch-actions"
    rows={[%{id: 1, name: "Load Balancer 3", port: "3000", status: "Disabled", protocol: "HTTP", group: "Kevin's VM Groups", rule: "Round robin"}, %{id: 2, name: "Load Balancer 1", port: "443", status: "Starting", protocol: "HTTP", group: "Maureen's VM Groups", rule: "Round robin"}, %{id: 3, name: "Load Balancer 2", port: "80", status: "Active", protocol: "HTTP", group: "Andrew's VM Groups", rule: "DNS delegation"}, %{id: 4, name: "Load Balancer 6", port: "3000", status: "Disabled", protocol: "HTTP", group: "Marc's VM Groups", rule: "Round robin"}, %{id: 5, name: "Load Balancer 4", port: "443", status: "Starting", protocol: "HTTP", group: "Mel's VM Groups", rule: "Round robin"}, %{id: 6, name: "Load Balancer 5", port: "80", status: "Active", protocol: "HTTP", group: "Ronja's VM Groups", rule: "DNS delegation"}]}
    selection_name="carbon-batch-actions"
    row_id={&Graphene.CarbonComponents.DataTable.Shared.row_id/1}
    selectable
  >
    <:title>DataTable</:title>
    <:description>With batch actions</:description>
    <:toolbar>
      <Graphene.CarbonComponents.table_toolbar>
        <Graphene.CarbonComponents.table_batch_actions total_rows_count="6">
          <Graphene.CarbonComponents.button kind="ghost">Delete</Graphene.CarbonComponents.button>
          <Graphene.CarbonComponents.button kind="ghost">Save</Graphene.CarbonComponents.button>
          <Graphene.CarbonComponents.button kind="ghost" href="#">Download</Graphene.CarbonComponents.button>
        </Graphene.CarbonComponents.table_batch_actions>
        <Graphene.CarbonComponents.table_toolbar_content has_batch_actions>
          <Graphene.CarbonComponents.table_toolbar_search placeholder="Filter table" />
          <Graphene.CarbonComponents.overflow_menu toolbar_action>
            <:icon>
              <Storybook.CarbonComponents.DataTable.Shared.overflow_icon />
            </:icon>
            <:tooltip_content>Settings</:tooltip_content>
            <:item>Action 1</:item>
            <:item>Action 2</:item>
            <:item>Action 3</:item>
          </Graphene.CarbonComponents.overflow_menu>
          <Graphene.CarbonComponents.button>Add new</Graphene.CarbonComponents.button>
        </Graphene.CarbonComponents.table_toolbar_content>
      </Graphene.CarbonComponents.table_toolbar>
    </:toolbar>
    <:col :for={col <- Storybook.CarbonComponents.DataTable.Shared.columns()} :let={row} label={col.label}>
      <%= Map.get(row, col.key) %>
    </:col>
  </.data_table>
  ```

  ```html
  <div id="batch-actions-single-batch-actions-component">
    <cds-table headerCount="0" is-selectable locale="en" size="lg" use-zebra-styles id="batch-actions-single-batch-actions" phx-hook="BasicComponentsTable" data-selected-ids="" phx-target="1" phx-update="ignore">
    
      <cds-table-head>
    
        <cds-table-header-row selection-label="Select all" selection-name="carbon-batch-actions">
    
          <cds-table-header-cell data-col-index="0">
    
            Name
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="1">
    
            Protocol
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="2">
    
            Port
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="3">
    
            Rule
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="4">
    
            Attached groups
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="5">
    
            Status
          
  </cds-table-header-cell>
          
        
  </cds-table-header-row>
      
  </cds-table-head>
      <cds-table-body id="batch-actions-single-batch-actionsbody">
    
        
          <cds-table-row selection-label="Select row" selection-name="carbon-batch-actions" selection-value="1" id="1" data-row-id="1">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 3

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    3000

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Kevin&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Disabled

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row selection-label="Select row" selection-name="carbon-batch-actions" selection-value="2" id="2" data-row-id="2">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 1

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    443

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Maureen&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Starting

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row selection-label="Select row" selection-name="carbon-batch-actions" selection-value="3" id="3" data-row-id="3">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 2

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    80

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    DNS delegation

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Andrew&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Active

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row selection-label="Select row" selection-name="carbon-batch-actions" selection-value="4" id="4" data-row-id="4">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 6

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    3000

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Marc&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Disabled

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row selection-label="Select row" selection-name="carbon-batch-actions" selection-value="5" id="5" data-row-id="5">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 4

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    443

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Mel&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Starting

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row selection-label="Select row" selection-name="carbon-batch-actions" selection-value="6" id="6" data-row-id="6">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 5

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    80

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    DNS delegation

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Ronja&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Active

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
      
  </cds-table-body>
    
    <div slot="title">
      
        <cds-table-header-title>
    
          DataTable
        
  </cds-table-header-title>
      
    </div>
    <div slot="description">
      
        <cds-table-header-description>
    
          With batch actions
        
  </cds-table-header-description>
      
    </div>
    <div slot="toolbar">
      
    <cds-table-toolbar>
    
      <cds-table-batch-actions selected-rows-count="0" size="lg" total-rows-count="6">
    
        <cds-button kind="ghost" link-role="button" size="lg" tab-index="0" tooltip-alignment="" tooltip-position="top" type="button">
    Delete
    
  </cds-button>
        <cds-button kind="ghost" link-role="button" size="lg" tab-index="0" tooltip-alignment="" tooltip-position="top" type="button">
    Save
    
  </cds-button>
        <cds-button href="#" kind="ghost" link-role="button" size="lg" tab-index="0" tooltip-alignment="" tooltip-position="top" type="button">
    Download
    
  </cds-button>
      
  </cds-table-batch-actions>
      <cds-table-toolbar-content has-batch-actions>
    
        <cds-table-toolbar-search autocomplete="off" placeholder="Filter table" size="lg">
    
  </cds-table-toolbar-search>
        <cds-overflow-menu align="top" close-on-activation enter-delay-ms="100" index="1" kind="primary" leave-delay-ms="300" link-role="button" size="md" tab-index="0" toolbar-action tooltip-alignment="" tooltip-position="top" type="button">
    
    <span slot="icon">
      
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" width="auto" fill="currentColor" preserveAspectRatio="xMidYMid meet" aria-hidden>
    
    
    <circle cx="8" cy="16" r="2"/><circle cx="16" cy="16" r="2"/><circle cx="24" cy="16" r="2"/>

  </svg>
          
    </span>
    <span slot="tooltip-content">
      Settings
    </span>
    <cds-overflow-menu-body direction="bottom" size="md">
    
      
        <cds-overflow-menu-item size="md">
    
          Action 1
        
  </cds-overflow-menu-item>
      
        <cds-overflow-menu-item size="md">
    
          Action 2
        
  </cds-overflow-menu-item>
      
        <cds-overflow-menu-item size="md">
    
          Action 3
        
  </cds-overflow-menu-item>
      
    
  </cds-overflow-menu-body>

    
    
  </cds-overflow-menu>
        <cds-button kind="primary" link-role="button" size="lg" tab-index="0" tooltip-alignment="" tooltip-position="top" type="button">
    Add new
    
  </cds-button>
      
  </cds-table-toolbar-content>
    
  </cds-table-toolbar>

    </div>
  </cds-table>
  </div>
  ```

  ##### compact

  ```heex
  <.data_table
    id="batch-actions-single-compact"
    size="sm"
    rows={[%{id: 1, name: "Load Balancer 3", port: "3000", status: "Disabled", protocol: "HTTP", group: "Kevin's VM Groups", rule: "Round robin"}, %{id: 2, name: "Load Balancer 1", port: "443", status: "Starting", protocol: "HTTP", group: "Maureen's VM Groups", rule: "Round robin"}, %{id: 3, name: "Load Balancer 2", port: "80", status: "Active", protocol: "HTTP", group: "Andrew's VM Groups", rule: "DNS delegation"}, %{id: 4, name: "Load Balancer 6", port: "3000", status: "Disabled", protocol: "HTTP", group: "Marc's VM Groups", rule: "Round robin"}, %{id: 5, name: "Load Balancer 4", port: "443", status: "Starting", protocol: "HTTP", group: "Mel's VM Groups", rule: "Round robin"}, %{id: 6, name: "Load Balancer 5", port: "80", status: "Active", protocol: "HTTP", group: "Ronja's VM Groups", rule: "DNS delegation"}]}
    selection_name="carbon-batch-actions"
    row_id={&Graphene.CarbonComponents.DataTable.Shared.row_id/1}
    selectable
  >
    <:title>DataTable</:title>
    <:description>Compact batch actions</:description>
    <:toolbar>
      <Graphene.CarbonComponents.table_toolbar>
        <Graphene.CarbonComponents.table_batch_actions total_rows_count="6">
          <Graphene.CarbonComponents.button kind="ghost">Delete</Graphene.CarbonComponents.button>
          <Graphene.CarbonComponents.button kind="ghost">Save</Graphene.CarbonComponents.button>
        </Graphene.CarbonComponents.table_batch_actions>
        <Graphene.CarbonComponents.table_toolbar_content has_batch_actions>
          <Graphene.CarbonComponents.table_toolbar_search placeholder="Filter table" />
          <Graphene.CarbonComponents.overflow_menu toolbar_action>
            <:icon>
              <Storybook.CarbonComponents.DataTable.Shared.overflow_icon />
            </:icon>
            <:tooltip_content>Settings</:tooltip_content>
            <:item>Action 1</:item>
            <:item>Action 2</:item>
          </Graphene.CarbonComponents.overflow_menu>
        </Graphene.CarbonComponents.table_toolbar_content>
      </Graphene.CarbonComponents.table_toolbar>
    </:toolbar>
    <:col :for={col <- Storybook.CarbonComponents.DataTable.Shared.columns()} :let={row} label={col.label}>
      <%= Map.get(row, col.key) %>
    </:col>
  </.data_table>
  ```

  ```html
  <div id="batch-actions-single-compact-component">
    <cds-table headerCount="0" is-selectable locale="en" size="sm" use-zebra-styles id="batch-actions-single-compact" phx-hook="BasicComponentsTable" data-selected-ids="" phx-target="1" phx-update="ignore">
    
      <cds-table-head>
    
        <cds-table-header-row selection-label="Select all" selection-name="carbon-batch-actions">
    
          <cds-table-header-cell data-col-index="0">
    
            Name
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="1">
    
            Protocol
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="2">
    
            Port
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="3">
    
            Rule
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="4">
    
            Attached groups
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="5">
    
            Status
          
  </cds-table-header-cell>
          
        
  </cds-table-header-row>
      
  </cds-table-head>
      <cds-table-body id="batch-actions-single-compactbody">
    
        
          <cds-table-row selection-label="Select row" selection-name="carbon-batch-actions" selection-value="1" id="1" data-row-id="1">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 3

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    3000

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Kevin&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Disabled

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row selection-label="Select row" selection-name="carbon-batch-actions" selection-value="2" id="2" data-row-id="2">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 1

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    443

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Maureen&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Starting

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row selection-label="Select row" selection-name="carbon-batch-actions" selection-value="3" id="3" data-row-id="3">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 2

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    80

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    DNS delegation

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Andrew&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Active

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row selection-label="Select row" selection-name="carbon-batch-actions" selection-value="4" id="4" data-row-id="4">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 6

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    3000

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Marc&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Disabled

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row selection-label="Select row" selection-name="carbon-batch-actions" selection-value="5" id="5" data-row-id="5">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 4

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    443

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Mel&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Starting

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row selection-label="Select row" selection-name="carbon-batch-actions" selection-value="6" id="6" data-row-id="6">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 5

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    80

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    DNS delegation

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Ronja&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Active

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
      
  </cds-table-body>
    
    <div slot="title">
      
        <cds-table-header-title>
    
          DataTable
        
  </cds-table-header-title>
      
    </div>
    <div slot="description">
      
        <cds-table-header-description>
    
          Compact batch actions
        
  </cds-table-header-description>
      
    </div>
    <div slot="toolbar">
      
    <cds-table-toolbar>
    
      <cds-table-batch-actions selected-rows-count="0" size="lg" total-rows-count="6">
    
        <cds-button kind="ghost" link-role="button" size="lg" tab-index="0" tooltip-alignment="" tooltip-position="top" type="button">
    Delete
    
  </cds-button>
        <cds-button kind="ghost" link-role="button" size="lg" tab-index="0" tooltip-alignment="" tooltip-position="top" type="button">
    Save
    
  </cds-button>
      
  </cds-table-batch-actions>
      <cds-table-toolbar-content has-batch-actions>
    
        <cds-table-toolbar-search autocomplete="off" placeholder="Filter table" size="lg">
    
  </cds-table-toolbar-search>
        <cds-overflow-menu align="top" close-on-activation enter-delay-ms="100" index="1" kind="primary" leave-delay-ms="300" link-role="button" size="md" tab-index="0" toolbar-action tooltip-alignment="" tooltip-position="top" type="button">
    
    <span slot="icon">
      
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" width="auto" fill="currentColor" preserveAspectRatio="xMidYMid meet" aria-hidden>
    
    
    <circle cx="8" cy="16" r="2"/><circle cx="16" cy="16" r="2"/><circle cx="24" cy="16" r="2"/>

  </svg>
          
    </span>
    <span slot="tooltip-content">
      Settings
    </span>
    <cds-overflow-menu-body direction="bottom" size="md">
    
      
        <cds-overflow-menu-item size="md">
    
          Action 1
        
  </cds-overflow-menu-item>
      
        <cds-overflow-menu-item size="md">
    
          Action 2
        
  </cds-overflow-menu-item>
      
    
  </cds-overflow-menu-body>

    
    
  </cds-overflow-menu>
      
  </cds-table-toolbar-content>
    
  </cds-table-toolbar>

    </div>
  </cds-table>
  </div>
  ```


  #### batch_expansion

  ##### batch_expansion

  ```heex
  <.data_table
    id="batch-expansion-single-batch-expansion"
    rows={[%{id: 1, name: "Load Balancer 3", port: "3000", status: "Disabled", protocol: "HTTP", group: "Kevin's VM Groups", rule: "Round robin"}, %{id: 2, name: "Load Balancer 1", port: "443", status: "Starting", protocol: "HTTP", group: "Maureen's VM Groups", rule: "Round robin"}, %{id: 3, name: "Load Balancer 2", port: "80", status: "Active", protocol: "HTTP", group: "Andrew's VM Groups", rule: "DNS delegation"}, %{id: 4, name: "Load Balancer 6", port: "3000", status: "Disabled", protocol: "HTTP", group: "Marc's VM Groups", rule: "Round robin"}, %{id: 5, name: "Load Balancer 4", port: "443", status: "Starting", protocol: "HTTP", group: "Mel's VM Groups", rule: "Round robin"}, %{id: 6, name: "Load Balancer 5", port: "80", status: "Active", protocol: "HTTP", group: "Ronja's VM Groups", rule: "DNS delegation"}]}
    row_id={&Graphene.CarbonComponents.DataTable.Shared.row_id/1}
    batch_expansion
    expandable
  >
    <:title>DataTable</:title>
    <:description>Batch expansion</:description>
    <:col :for={col <- Storybook.CarbonComponents.DataTable.Shared.columns()} :let={row} label={col.label}>
      <%= Map.get(row, col.key) %>
    </:col>
    <:expanded_row :let={row}>
      <h6>Expandable row content</h6>
      <div><%= Storybook.CarbonComponents.DataTable.Shared.expanded_content(row) %></div>
    </:expanded_row>
  </.data_table>
  ```

  ```html
  <div id="batch-expansion-single-batch-expansion-component">
    <cds-table batch-expansion expandable headerCount="0" locale="en" size="lg" use-zebra-styles id="batch-expansion-single-batch-expansion" phx-hook="BasicComponentsTable" data-selected-ids="" phx-target="1" phx-update="ignore">
    
      <cds-table-head>
    
        <cds-table-header-row batch-expansion>
    
          <cds-table-header-cell data-col-index="0">
    
            Name
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="1">
    
            Protocol
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="2">
    
            Port
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="3">
    
            Rule
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="4">
    
            Attached groups
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="5">
    
            Status
          
  </cds-table-header-cell>
          
        
  </cds-table-header-row>
      
  </cds-table-head>
      <cds-table-body id="batch-expansion-single-batch-expansionbody">
    
        
          <cds-table-row batch-expansion id="1" data-row-id="1">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 3

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    3000

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Kevin&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Disabled

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          <cds-table-expanded-row colspan="1">
    
            
              
    <h6>Expandable row content</h6>
    <div>Expandable content for Load Balancer 3</div>

            
          
  </cds-table-expanded-row>
        
          <cds-table-row batch-expansion id="2" data-row-id="2">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 1

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    443

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Maureen&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Starting

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          <cds-table-expanded-row colspan="1">
    
            
              
    <h6>Expandable row content</h6>
    <div>Expandable content for Load Balancer 1</div>

            
          
  </cds-table-expanded-row>
        
          <cds-table-row batch-expansion id="3" data-row-id="3">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 2

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    80

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    DNS delegation

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Andrew&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Active

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          <cds-table-expanded-row colspan="1">
    
            
              
    <h6>Expandable row content</h6>
    <div>Expandable content for Load Balancer 2</div>

            
          
  </cds-table-expanded-row>
        
          <cds-table-row batch-expansion id="4" data-row-id="4">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 6

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    3000

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Marc&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Disabled

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          <cds-table-expanded-row colspan="1">
    
            
              
    <h6>Expandable row content</h6>
    <div>Expandable content for Load Balancer 6</div>

            
          
  </cds-table-expanded-row>
        
          <cds-table-row batch-expansion id="5" data-row-id="5">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 4

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    443

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Mel&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Starting

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          <cds-table-expanded-row colspan="1">
    
            
              
    <h6>Expandable row content</h6>
    <div>Expandable content for Load Balancer 4</div>

            
          
  </cds-table-expanded-row>
        
          <cds-table-row batch-expansion id="6" data-row-id="6">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 5

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    80

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    DNS delegation

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Ronja&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Active

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          <cds-table-expanded-row colspan="1">
    
            
              
    <h6>Expandable row content</h6>
    <div>Expandable content for Load Balancer 5</div>

            
          
  </cds-table-expanded-row>
        
      
  </cds-table-body>
    
    <div slot="title">
      
        <cds-table-header-title>
    
          DataTable
        
  </cds-table-header-title>
      
    </div>
    <div slot="description">
      
        <cds-table-header-description>
    
          Batch expansion
        
  </cds-table-header-description>
      
    </div>
    
  </cds-table>
  </div>
  ```

  ##### expandable_only

  ```heex
  <.data_table
    id="batch-expansion-single-expandable-only"
    rows={[%{id: 1, name: "Load Balancer 3", port: "3000", status: "Disabled", protocol: "HTTP", group: "Kevin's VM Groups", rule: "Round robin"}, %{id: 2, name: "Load Balancer 1", port: "443", status: "Starting", protocol: "HTTP", group: "Maureen's VM Groups", rule: "Round robin"}, %{id: 3, name: "Load Balancer 2", port: "80", status: "Active", protocol: "HTTP", group: "Andrew's VM Groups", rule: "DNS delegation"}, %{id: 4, name: "Load Balancer 6", port: "3000", status: "Disabled", protocol: "HTTP", group: "Marc's VM Groups", rule: "Round robin"}, %{id: 5, name: "Load Balancer 4", port: "443", status: "Starting", protocol: "HTTP", group: "Mel's VM Groups", rule: "Round robin"}, %{id: 6, name: "Load Balancer 5", port: "80", status: "Active", protocol: "HTTP", group: "Ronja's VM Groups", rule: "DNS delegation"}]}
    row_id={&Graphene.CarbonComponents.DataTable.Shared.row_id/1}
    expandable
  >
    <:title>DataTable</:title>
    <:description>Expandable rows</:description>
    <:col :for={col <- Storybook.CarbonComponents.DataTable.Shared.columns()} :let={row} label={col.label}>
      <%= Map.get(row, col.key) %>
    </:col>
    <:expanded_row :let={row}>
      <h6>Details</h6>
      <div><%= Storybook.CarbonComponents.DataTable.Shared.expanded_content(row) %></div>
    </:expanded_row>
  </.data_table>
  ```

  ```html
  <div id="batch-expansion-single-expandable-only-component">
    <cds-table expandable headerCount="0" locale="en" size="lg" use-zebra-styles id="batch-expansion-single-expandable-only" phx-hook="BasicComponentsTable" data-selected-ids="" phx-target="1" phx-update="ignore">
    
      <cds-table-head>
    
        <cds-table-header-row>
    
          <cds-table-header-cell data-col-index="0">
    
            Name
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="1">
    
            Protocol
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="2">
    
            Port
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="3">
    
            Rule
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="4">
    
            Attached groups
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="5">
    
            Status
          
  </cds-table-header-cell>
          
        
  </cds-table-header-row>
      
  </cds-table-head>
      <cds-table-body id="batch-expansion-single-expandable-onlybody">
    
        
          <cds-table-row id="1" data-row-id="1">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 3

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    3000

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Kevin&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Disabled

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          <cds-table-expanded-row colspan="1">
    
            
              
    <h6>Details</h6>
    <div>Expandable content for Load Balancer 3</div>

            
          
  </cds-table-expanded-row>
        
          <cds-table-row id="2" data-row-id="2">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 1

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    443

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Maureen&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Starting

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          <cds-table-expanded-row colspan="1">
    
            
              
    <h6>Details</h6>
    <div>Expandable content for Load Balancer 1</div>

            
          
  </cds-table-expanded-row>
        
          <cds-table-row id="3" data-row-id="3">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 2

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    80

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    DNS delegation

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Andrew&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Active

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          <cds-table-expanded-row colspan="1">
    
            
              
    <h6>Details</h6>
    <div>Expandable content for Load Balancer 2</div>

            
          
  </cds-table-expanded-row>
        
          <cds-table-row id="4" data-row-id="4">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 6

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    3000

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Marc&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Disabled

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          <cds-table-expanded-row colspan="1">
    
            
              
    <h6>Details</h6>
    <div>Expandable content for Load Balancer 6</div>

            
          
  </cds-table-expanded-row>
        
          <cds-table-row id="5" data-row-id="5">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 4

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    443

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Mel&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Starting

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          <cds-table-expanded-row colspan="1">
    
            
              
    <h6>Details</h6>
    <div>Expandable content for Load Balancer 4</div>

            
          
  </cds-table-expanded-row>
        
          <cds-table-row id="6" data-row-id="6">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 5

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    80

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    DNS delegation

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Ronja&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Active

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          <cds-table-expanded-row colspan="1">
    
            
              
    <h6>Details</h6>
    <div>Expandable content for Load Balancer 5</div>

            
          
  </cds-table-expanded-row>
        
      
  </cds-table-body>
    
    <div slot="title">
      
        <cds-table-header-title>
    
          DataTable
        
  </cds-table-header-title>
      
    </div>
    <div slot="description">
      
        <cds-table-header-description>
    
          Expandable rows
        
  </cds-table-header-description>
      
    </div>
    
  </cds-table>
  </div>
  ```


  #### dynamic

  ##### example

  ```heex
  <div class="psb-sandbox">
        <.button phx-click="add-row">Add row</.button>
      </div>

      <.data_table
        id="carbon-dynamic-table"
        rows={@rows}
        row_id={&Graphene.CarbonComponents.DataTable.Shared.row_id/1}
        phx_update={false}
      >
        <:title>DataTable</:title>
        <:description>Dynamic rows</:description>

        <:col :for={col <- @columns} :let={row} label={col.label}>
          <%= Map.get(row, col.key) %>
        </:col>
      </.data_table>
  ```

  ```html
  <div class="psb-sandbox">
    <cds-button kind="primary" link-role="button" size="lg" tab-index="0" tooltip-alignment="" tooltip-position="top" type="button" phx-click="add-row">
    Add row
    
  </cds-button>
  </div>

  <div id="carbon-dynamic-table-component">
    <cds-table headerCount="0" locale="en" size="lg" use-zebra-styles id="carbon-dynamic-table" phx-hook="BasicComponentsTable" data-selected-ids="" phx-target="1">
    
      <cds-table-head>
    
        <cds-table-header-row>
    
          <cds-table-header-cell data-col-index="0">
    
            Name
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="1">
    
            Protocol
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="2">
    
            Port
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="3">
    
            Rule
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="4">
    
            Attached groups
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="5">
    
            Status
          
  </cds-table-header-cell>
          
        
  </cds-table-header-row>
      
  </cds-table-head>
      <cds-table-body id="carbon-dynamic-tablebody">
    
        
          <cds-table-row id="1" data-row-id="1">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
      Load Balancer 3
    
              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
      HTTP
    
              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
      3000
    
              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
      Round robin
    
              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
      Kevin&#39;s VM Groups
    
              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
      Disabled
    
              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row id="2" data-row-id="2">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
      Load Balancer 1
    
              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
      HTTP
    
              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
      443
    
              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
      Round robin
    
              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
      Maureen&#39;s VM Groups
    
              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
      Starting
    
              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row id="3" data-row-id="3">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
      Load Balancer 2
    
              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
      HTTP
    
              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
      80
    
              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
      DNS delegation
    
              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
      Andrew&#39;s VM Groups
    
              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
      Active
    
              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
      
  </cds-table-body>
    
    <div slot="title">
      
        <cds-table-header-title>
    
          DataTable
        
  </cds-table-header-title>
      
    </div>
    <div slot="description">
      
        <cds-table-header-description>
    
          Dynamic rows
        
  </cds-table-header-description>
      
    </div>
    
  </cds-table>
  </div>
  ```


  #### expansion

  ##### expandable

  ```heex
  <.data_table
    id="expansion-single-expandable"
    rows={[%{id: 1, name: "Load Balancer 3", port: "3000", status: "Disabled", protocol: "HTTP", group: "Kevin's VM Groups", rule: "Round robin"}, %{id: 2, name: "Load Balancer 1", port: "443", status: "Starting", protocol: "HTTP", group: "Maureen's VM Groups", rule: "Round robin"}, %{id: 3, name: "Load Balancer 2", port: "80", status: "Active", protocol: "HTTP", group: "Andrew's VM Groups", rule: "DNS delegation"}, %{id: 4, name: "Load Balancer 6", port: "3000", status: "Disabled", protocol: "HTTP", group: "Marc's VM Groups", rule: "Round robin"}, %{id: 5, name: "Load Balancer 4", port: "443", status: "Starting", protocol: "HTTP", group: "Mel's VM Groups", rule: "Round robin"}, %{id: 6, name: "Load Balancer 5", port: "80", status: "Active", protocol: "HTTP", group: "Ronja's VM Groups", rule: "DNS delegation"}]}
    row_id={&Graphene.CarbonComponents.DataTable.Shared.row_id/1}
    expandable
  >
    <:title>DataTable</:title>
    <:description>Expandable rows</:description>
    <:col :for={col <- Storybook.CarbonComponents.DataTable.Shared.columns()} :let={row} label={col.label}>
      <%= Map.get(row, col.key) %>
    </:col>
    <:expanded_row :let={row}>
      <h6>Expandable row content</h6>
      <div><%= Storybook.CarbonComponents.DataTable.Shared.expanded_content(row) %></div>
    </:expanded_row>
  </.data_table>
  ```

  ```html
  <div id="expansion-single-expandable-component">
    <cds-table expandable headerCount="0" locale="en" size="lg" use-zebra-styles id="expansion-single-expandable" phx-hook="BasicComponentsTable" data-selected-ids="" phx-target="1" phx-update="ignore">
    
      <cds-table-head>
    
        <cds-table-header-row>
    
          <cds-table-header-cell data-col-index="0">
    
            Name
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="1">
    
            Protocol
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="2">
    
            Port
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="3">
    
            Rule
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="4">
    
            Attached groups
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="5">
    
            Status
          
  </cds-table-header-cell>
          
        
  </cds-table-header-row>
      
  </cds-table-head>
      <cds-table-body id="expansion-single-expandablebody">
    
        
          <cds-table-row id="1" data-row-id="1">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 3

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    3000

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Kevin&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Disabled

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          <cds-table-expanded-row colspan="1">
    
            
              
    <h6>Expandable row content</h6>
    <div>Expandable content for Load Balancer 3</div>

            
          
  </cds-table-expanded-row>
        
          <cds-table-row id="2" data-row-id="2">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 1

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    443

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Maureen&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Starting

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          <cds-table-expanded-row colspan="1">
    
            
              
    <h6>Expandable row content</h6>
    <div>Expandable content for Load Balancer 1</div>

            
          
  </cds-table-expanded-row>
        
          <cds-table-row id="3" data-row-id="3">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 2

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    80

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    DNS delegation

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Andrew&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Active

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          <cds-table-expanded-row colspan="1">
    
            
              
    <h6>Expandable row content</h6>
    <div>Expandable content for Load Balancer 2</div>

            
          
  </cds-table-expanded-row>
        
          <cds-table-row id="4" data-row-id="4">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 6

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    3000

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Marc&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Disabled

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          <cds-table-expanded-row colspan="1">
    
            
              
    <h6>Expandable row content</h6>
    <div>Expandable content for Load Balancer 6</div>

            
          
  </cds-table-expanded-row>
        
          <cds-table-row id="5" data-row-id="5">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 4

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    443

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Mel&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Starting

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          <cds-table-expanded-row colspan="1">
    
            
              
    <h6>Expandable row content</h6>
    <div>Expandable content for Load Balancer 4</div>

            
          
  </cds-table-expanded-row>
        
          <cds-table-row id="6" data-row-id="6">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 5

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    80

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    DNS delegation

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Ronja&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Active

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          <cds-table-expanded-row colspan="1">
    
            
              
    <h6>Expandable row content</h6>
    <div>Expandable content for Load Balancer 5</div>

            
          
  </cds-table-expanded-row>
        
      
  </cds-table-body>
    
    <div slot="title">
      
        <cds-table-header-title>
    
          DataTable
        
  </cds-table-header-title>
      
    </div>
    <div slot="description">
      
        <cds-table-header-description>
    
          Expandable rows
        
  </cds-table-header-description>
      
    </div>
    
  </cds-table>
  </div>
  ```

  ##### compact

  ```heex
  <.data_table
    id="expansion-single-compact"
    size="sm"
    rows={[%{id: 1, name: "Load Balancer 3", port: "3000", status: "Disabled", protocol: "HTTP", group: "Kevin's VM Groups", rule: "Round robin"}, %{id: 2, name: "Load Balancer 1", port: "443", status: "Starting", protocol: "HTTP", group: "Maureen's VM Groups", rule: "Round robin"}, %{id: 3, name: "Load Balancer 2", port: "80", status: "Active", protocol: "HTTP", group: "Andrew's VM Groups", rule: "DNS delegation"}, %{id: 4, name: "Load Balancer 6", port: "3000", status: "Disabled", protocol: "HTTP", group: "Marc's VM Groups", rule: "Round robin"}, %{id: 5, name: "Load Balancer 4", port: "443", status: "Starting", protocol: "HTTP", group: "Mel's VM Groups", rule: "Round robin"}, %{id: 6, name: "Load Balancer 5", port: "80", status: "Active", protocol: "HTTP", group: "Ronja's VM Groups", rule: "DNS delegation"}]}
    row_id={&Graphene.CarbonComponents.DataTable.Shared.row_id/1}
    expandable
  >
    <:title>DataTable</:title>
    <:description>Compact expandable</:description>
    <:col :for={col <- Storybook.CarbonComponents.DataTable.Shared.columns()} :let={row} label={col.label}>
      <%= Map.get(row, col.key) %>
    </:col>
    <:expanded_row :let={row}>
      <h6>Details</h6>
      <div><%= Storybook.CarbonComponents.DataTable.Shared.expanded_content(row) %></div>
    </:expanded_row>
  </.data_table>
  ```

  ```html
  <div id="expansion-single-compact-component">
    <cds-table expandable headerCount="0" locale="en" size="sm" id="expansion-single-compact" phx-hook="BasicComponentsTable" data-selected-ids="" phx-target="1" phx-update="ignore">
    
      <cds-table-head>
    
        <cds-table-header-row>
    
          <cds-table-header-cell data-col-index="0">
    
            Name
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="1">
    
            Protocol
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="2">
    
            Port
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="3">
    
            Rule
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="4">
    
            Attached groups
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="5">
    
            Status
          
  </cds-table-header-cell>
          
        
  </cds-table-header-row>
      
  </cds-table-head>
      <cds-table-body id="expansion-single-compactbody">
    
        
          <cds-table-row id="1" data-row-id="1">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 3

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    3000

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Kevin&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Disabled

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          <cds-table-expanded-row colspan="1">
    
            
              
    <h6>Details</h6>
    <div>Expandable content for Load Balancer 3</div>

            
          
  </cds-table-expanded-row>
        
          <cds-table-row id="2" data-row-id="2">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 1

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    443

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Maureen&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Starting

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          <cds-table-expanded-row colspan="1">
    
            
              
    <h6>Details</h6>
    <div>Expandable content for Load Balancer 1</div>

            
          
  </cds-table-expanded-row>
        
          <cds-table-row id="3" data-row-id="3">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 2

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    80

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    DNS delegation

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Andrew&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Active

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          <cds-table-expanded-row colspan="1">
    
            
              
    <h6>Details</h6>
    <div>Expandable content for Load Balancer 2</div>

            
          
  </cds-table-expanded-row>
        
          <cds-table-row id="4" data-row-id="4">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 6

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    3000

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Marc&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Disabled

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          <cds-table-expanded-row colspan="1">
    
            
              
    <h6>Details</h6>
    <div>Expandable content for Load Balancer 6</div>

            
          
  </cds-table-expanded-row>
        
          <cds-table-row id="5" data-row-id="5">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 4

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    443

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Mel&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Starting

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          <cds-table-expanded-row colspan="1">
    
            
              
    <h6>Details</h6>
    <div>Expandable content for Load Balancer 4</div>

            
          
  </cds-table-expanded-row>
        
          <cds-table-row id="6" data-row-id="6">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 5

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    80

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    DNS delegation

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Ronja&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Active

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          <cds-table-expanded-row colspan="1">
    
            
              
    <h6>Details</h6>
    <div>Expandable content for Load Balancer 5</div>

            
          
  </cds-table-expanded-row>
        
      
  </cds-table-body>
    
    <div slot="title">
      
        <cds-table-header-title>
    
          DataTable
        
  </cds-table-header-title>
      
    </div>
    <div slot="description">
      
        <cds-table-header-description>
    
          Compact expandable
        
  </cds-table-header-description>
      
    </div>
    
  </cds-table>
  </div>
  ```


  #### filtering

  ##### persistent

  ```heex
  <.data_table
    id="filtering-single-persistent"
    rows={[%{id: 1, name: "Load Balancer 3", port: "3000", status: "Disabled", protocol: "HTTP", group: "Kevin's VM Groups", rule: "Round robin"}, %{id: 2, name: "Load Balancer 1", port: "443", status: "Starting", protocol: "HTTP", group: "Maureen's VM Groups", rule: "Round robin"}, %{id: 3, name: "Load Balancer 2", port: "80", status: "Active", protocol: "HTTP", group: "Andrew's VM Groups", rule: "DNS delegation"}, %{id: 4, name: "Load Balancer 6", port: "3000", status: "Disabled", protocol: "HTTP", group: "Marc's VM Groups", rule: "Round robin"}, %{id: 5, name: "Load Balancer 4", port: "443", status: "Starting", protocol: "HTTP", group: "Mel's VM Groups", rule: "Round robin"}, %{id: 6, name: "Load Balancer 5", port: "80", status: "Active", protocol: "HTTP", group: "Ronja's VM Groups", rule: "DNS delegation"}]}
    row_id={&Graphene.CarbonComponents.DataTable.Shared.row_id/1}
  >
    <:title>DataTable</:title>
    <:description>With filtering</:description>
    <:toolbar>
      <Graphene.CarbonComponents.table_toolbar>
        <Graphene.CarbonComponents.table_toolbar_content>
          <Graphene.CarbonComponents.table_toolbar_search placeholder="Filter table" persistent={true} />
          <Graphene.CarbonComponents.overflow_menu toolbar_action>
            <:icon>
              <Storybook.CarbonComponents.DataTable.Shared.overflow_icon />
            </:icon>
            <:tooltip_content>Settings</:tooltip_content>
            <:item>Action 1</:item>
            <:item>Action 2</:item>
            <:item>Action 3</:item>
          </Graphene.CarbonComponents.overflow_menu>
          <Graphene.CarbonComponents.button>Primary button</Graphene.CarbonComponents.button>
        </Graphene.CarbonComponents.table_toolbar_content>
      </Graphene.CarbonComponents.table_toolbar>
    </:toolbar>
    <:col :for={col <- Storybook.CarbonComponents.DataTable.Shared.columns()} :let={row} label={col.label}>
      <%= Map.get(row, col.key) %>
    </:col>
  </.data_table>
  ```

  ```html
  <div id="filtering-single-persistent-component">
    <cds-table headerCount="0" locale="en" size="lg" use-zebra-styles id="filtering-single-persistent" phx-hook="BasicComponentsTable" data-selected-ids="" phx-target="1" phx-update="ignore">
    
      <cds-table-head>
    
        <cds-table-header-row>
    
          <cds-table-header-cell data-col-index="0">
    
            Name
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="1">
    
            Protocol
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="2">
    
            Port
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="3">
    
            Rule
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="4">
    
            Attached groups
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="5">
    
            Status
          
  </cds-table-header-cell>
          
        
  </cds-table-header-row>
      
  </cds-table-head>
      <cds-table-body id="filtering-single-persistentbody">
    
        
          <cds-table-row id="1" data-row-id="1">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 3

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    3000

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Kevin&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Disabled

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row id="2" data-row-id="2">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 1

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    443

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Maureen&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Starting

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row id="3" data-row-id="3">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 2

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    80

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    DNS delegation

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Andrew&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Active

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row id="4" data-row-id="4">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 6

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    3000

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Marc&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Disabled

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row id="5" data-row-id="5">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 4

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    443

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Mel&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Starting

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row id="6" data-row-id="6">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 5

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    80

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    DNS delegation

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Ronja&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Active

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
      
  </cds-table-body>
    
    <div slot="title">
      
        <cds-table-header-title>
    
          DataTable
        
  </cds-table-header-title>
      
    </div>
    <div slot="description">
      
        <cds-table-header-description>
    
          With filtering
        
  </cds-table-header-description>
      
    </div>
    <div slot="toolbar">
      
    <cds-table-toolbar>
    
      <cds-table-toolbar-content>
    
        <cds-table-toolbar-search autocomplete="off" persistent placeholder="Filter table" size="lg">
    
  </cds-table-toolbar-search>
        <cds-overflow-menu align="top" close-on-activation enter-delay-ms="100" index="1" kind="primary" leave-delay-ms="300" link-role="button" size="md" tab-index="0" toolbar-action tooltip-alignment="" tooltip-position="top" type="button">
    
    <span slot="icon">
      
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" width="auto" fill="currentColor" preserveAspectRatio="xMidYMid meet" aria-hidden>
    
    
    <circle cx="8" cy="16" r="2"/><circle cx="16" cy="16" r="2"/><circle cx="24" cy="16" r="2"/>

  </svg>
          
    </span>
    <span slot="tooltip-content">
      Settings
    </span>
    <cds-overflow-menu-body direction="bottom" size="md">
    
      
        <cds-overflow-menu-item size="md">
    
          Action 1
        
  </cds-overflow-menu-item>
      
        <cds-overflow-menu-item size="md">
    
          Action 2
        
  </cds-overflow-menu-item>
      
        <cds-overflow-menu-item size="md">
    
          Action 3
        
  </cds-overflow-menu-item>
      
    
  </cds-overflow-menu-body>

    
    
  </cds-overflow-menu>
        <cds-button kind="primary" link-role="button" size="lg" tab-index="0" tooltip-alignment="" tooltip-position="top" type="button">
    Primary button
    
  </cds-button>
      
  </cds-table-toolbar-content>
    
  </cds-table-toolbar>

    </div>
  </cds-table>
  </div>
  ```

  ##### compact

  ```heex
  <.data_table
    id="filtering-single-compact"
    size="sm"
    rows={[%{id: 1, name: "Load Balancer 3", port: "3000", status: "Disabled", protocol: "HTTP", group: "Kevin's VM Groups", rule: "Round robin"}, %{id: 2, name: "Load Balancer 1", port: "443", status: "Starting", protocol: "HTTP", group: "Maureen's VM Groups", rule: "Round robin"}, %{id: 3, name: "Load Balancer 2", port: "80", status: "Active", protocol: "HTTP", group: "Andrew's VM Groups", rule: "DNS delegation"}, %{id: 4, name: "Load Balancer 6", port: "3000", status: "Disabled", protocol: "HTTP", group: "Marc's VM Groups", rule: "Round robin"}, %{id: 5, name: "Load Balancer 4", port: "443", status: "Starting", protocol: "HTTP", group: "Mel's VM Groups", rule: "Round robin"}, %{id: 6, name: "Load Balancer 5", port: "80", status: "Active", protocol: "HTTP", group: "Ronja's VM Groups", rule: "DNS delegation"}]}
    row_id={&Graphene.CarbonComponents.DataTable.Shared.row_id/1}
  >
    <:title>DataTable</:title>
    <:description>Compact filter</:description>
    <:toolbar>
      <Graphene.CarbonComponents.table_toolbar>
        <Graphene.CarbonComponents.table_toolbar_content>
          <Graphene.CarbonComponents.table_toolbar_search placeholder="Filter table" persistent={true} />
          <Graphene.CarbonComponents.overflow_menu toolbar_action>
            <:icon>
              <Storybook.CarbonComponents.DataTable.Shared.overflow_icon />
            </:icon>
            <:tooltip_content>Settings</:tooltip_content>
            <:item>Action 1</:item>
            <:item>Action 2</:item>
          </Graphene.CarbonComponents.overflow_menu>
        </Graphene.CarbonComponents.table_toolbar_content>
      </Graphene.CarbonComponents.table_toolbar>
    </:toolbar>
    <:col :for={col <- Storybook.CarbonComponents.DataTable.Shared.columns()} :let={row} label={col.label}>
      <%= Map.get(row, col.key) %>
    </:col>
  </.data_table>
  ```

  ```html
  <div id="filtering-single-compact-component">
    <cds-table headerCount="0" locale="en" size="sm" use-zebra-styles id="filtering-single-compact" phx-hook="BasicComponentsTable" data-selected-ids="" phx-target="1" phx-update="ignore">
    
      <cds-table-head>
    
        <cds-table-header-row>
    
          <cds-table-header-cell data-col-index="0">
    
            Name
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="1">
    
            Protocol
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="2">
    
            Port
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="3">
    
            Rule
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="4">
    
            Attached groups
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="5">
    
            Status
          
  </cds-table-header-cell>
          
        
  </cds-table-header-row>
      
  </cds-table-head>
      <cds-table-body id="filtering-single-compactbody">
    
        
          <cds-table-row id="1" data-row-id="1">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 3

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    3000

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Kevin&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Disabled

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row id="2" data-row-id="2">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 1

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    443

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Maureen&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Starting

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row id="3" data-row-id="3">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 2

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    80

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    DNS delegation

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Andrew&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Active

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row id="4" data-row-id="4">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 6

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    3000

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Marc&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Disabled

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row id="5" data-row-id="5">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 4

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    443

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Mel&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Starting

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row id="6" data-row-id="6">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 5

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    80

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    DNS delegation

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Ronja&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Active

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
      
  </cds-table-body>
    
    <div slot="title">
      
        <cds-table-header-title>
    
          DataTable
        
  </cds-table-header-title>
      
    </div>
    <div slot="description">
      
        <cds-table-header-description>
    
          Compact filter
        
  </cds-table-header-description>
      
    </div>
    <div slot="toolbar">
      
    <cds-table-toolbar>
    
      <cds-table-toolbar-content>
    
        <cds-table-toolbar-search autocomplete="off" persistent placeholder="Filter table" size="lg">
    
  </cds-table-toolbar-search>
        <cds-overflow-menu align="top" close-on-activation enter-delay-ms="100" index="1" kind="primary" leave-delay-ms="300" link-role="button" size="md" tab-index="0" toolbar-action tooltip-alignment="" tooltip-position="top" type="button">
    
    <span slot="icon">
      
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" width="auto" fill="currentColor" preserveAspectRatio="xMidYMid meet" aria-hidden>
    
    
    <circle cx="8" cy="16" r="2"/><circle cx="16" cy="16" r="2"/><circle cx="24" cy="16" r="2"/>

  </svg>
          
    </span>
    <span slot="tooltip-content">
      Settings
    </span>
    <cds-overflow-menu-body direction="bottom" size="md">
    
      
        <cds-overflow-menu-item size="md">
    
          Action 1
        
  </cds-overflow-menu-item>
      
        <cds-overflow-menu-item size="md">
    
          Action 2
        
  </cds-overflow-menu-item>
      
    
  </cds-overflow-menu-body>

    
    
  </cds-overflow-menu>
      
  </cds-table-toolbar-content>
    
  </cds-table-toolbar>

    </div>
  </cds-table>
  </div>
  ```


  #### interactivity

  ##### example

  ```heex
  <.data_table
        id="carbon-events-table"
        rows={@rows}
        row_id={&Graphene.CarbonComponents.DataTable.Shared.row_id/1}
        selectable={true}
        sortable={true}
        expandable={true}
        batch_expansion={true}
        selection_name="carbon-events"
        with_row_ai_labels={true}
        on_row_selected={event_handler("row_selected")}
        on_row_all_selected={event_handler("row_all_selected")}
        on_sorted={event_handler("sorted")}
        on_filtered={event_handler("filtered")}
        on_search={event_handler("search")}
        on_batch_cancel={event_handler("batch_cancel")}
      >
        <:title>DataTable</:title>
        <:description>Advanced interactivity with callbacks</:description>
        <:toolbar>
          <.table_toolbar>
            <.table_batch_actions total_rows_count="6">
              <.button kind="ghost">Delete</.button>
              <.button kind="ghost">Save</.button>
              <.button kind="ghost" href="#">Download</.button>
            </.table_batch_actions>
            <.table_toolbar_content has_batch_actions>
              <.table_toolbar_search placeholder="Filter table" />
              <.overflow_menu toolbar_action>
                <:icon>
                  <Storybook.CarbonComponents.DataTable.Shared.overflow_icon />
                </:icon>
                <:tooltip_content>Settings</:tooltip_content>
                <:item>Action 1</:item>
                <:item>Action 2</:item>
                <:item>Action 3</:item>
              </.overflow_menu>
              <.button>Add new</.button>
            </.table_toolbar_content>
          </.table_toolbar>
        </:toolbar>

        <:row_decorator :let={row}>
          <%= if rem(row.id, 2) == 0 do %>
            <Storybook.CarbonComponents.DataTable.Shared.ai_label />
          <% end %>
        </:row_decorator>

        <:col :let={row} :for={col <- @columns} label={col.label}>
          {Map.get(row, col.key)}
        </:col>

        <:action :let={_row}>
          <.overflow_menu toolbar_action flipped>
            <:icon>
              <Storybook.CarbonComponents.DataTable.Shared.overflow_icon />
            </:icon>
            <:tooltip_content>Options</:tooltip_content>
            <:item>Stop app</:item>
            <:item>Restart app</:item>
            <:item>Rename</:item>
          </.overflow_menu>
        </:action>

        <:expanded_row :let={row}>
          <h6>Expandable row content</h6>
          <div>{Storybook.CarbonComponents.DataTable.Shared.expanded_content(row)}</div>
        </:expanded_row>
      </.data_table>

      <h4>Event log</h4>
      <pre id="carbon-events-log">
        <%= for log <- Enum.reverse(@logs) do %>
          [<%= log.type %>] <%= inspect(log.payload) %>
        <% end %>
      </pre>

      <h4>Callback controls</h4>
      <p>These buttons dispatch the same events as the built-in controls.</p>
      <div id="carbon-events-simulator">
        <%= for {label, detail} <- simulator_events() do %>
          <.button
            kind="tertiary"
            phx-click={
              JS.dispatch(
                "graphene:table-simulate",
                detail: detail,
                to: "#carbon-events-table"
              )
            }
          >
            {label}
          </.button>
        <% end %>
      </div>
  ```

  ```html
  <div id="carbon-events-table-component">
    <cds-table batch-expansion expandable headerCount="0" is-selectable is-sortable locale="en" size="lg" use-zebra-styles with-row-ai-labels id="carbon-events-table" phx-hook="BasicComponentsTable" data-selected-ids="" phx-target="1" phx-update="ignore">
    
      <cds-table-head>
    
        <cds-table-header-row batch-expansion selection-label="Select all" selection-name="carbon-events">
    
          <cds-table-header-cell is-sortable data-col-index="0">
    
            Name
          
  </cds-table-header-cell><cds-table-header-cell is-sortable data-col-index="1">
    
            Protocol
          
  </cds-table-header-cell><cds-table-header-cell is-sortable data-col-index="2">
    
            Port
          
  </cds-table-header-cell><cds-table-header-cell is-sortable data-col-index="3">
    
            Rule
          
  </cds-table-header-cell><cds-table-header-cell is-sortable data-col-index="4">
    
            Attached groups
          
  </cds-table-header-cell><cds-table-header-cell is-sortable data-col-index="5">
    
            Status
          
  </cds-table-header-cell>
          <cds-table-header-cell>
    
            <span class="sr-only">Actions</span>
          
  </cds-table-header-cell>
        
  </cds-table-header-row>
      
  </cds-table-head>
      <cds-table-body id="carbon-events-tablebody">
    
        
          <cds-table-row batch-expansion selection-label="Select row" selection-name="carbon-events" selection-value="1" id="1" data-row-id="1">
    
            
              
      
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
      Load Balancer 3
    
              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
      HTTP
    
              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
      3000
    
              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
      Round robin
    
              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
      Kevin&#39;s VM Groups
    
              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
      Disabled
    
              
  </cds-table-cell-content>
            
  </cds-table-cell>
            <cds-table-cell>
    
              <div>
                
                  
      <cds-overflow-menu align="top" close-on-activation enter-delay-ms="100" flipped index="1" kind="primary" leave-delay-ms="300" link-role="button" size="md" tab-index="0" toolbar-action tooltip-alignment="" tooltip-position="top" type="button">
    
    <span slot="icon">
      
          <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" width="auto" fill="currentColor" preserveAspectRatio="xMidYMid meet" aria-hidden>
    
    
    <circle cx="8" cy="16" r="2"/><circle cx="16" cy="16" r="2"/><circle cx="24" cy="16" r="2"/>

  </svg>
        
    </span>
    <span slot="tooltip-content">
      Options
    </span>
    <cds-overflow-menu-body direction="bottom" size="md">
    
      
        <cds-overflow-menu-item size="md">
    
          Stop app
        
  </cds-overflow-menu-item>
      
        <cds-overflow-menu-item size="md">
    
          Restart app
        
  </cds-overflow-menu-item>
      
        <cds-overflow-menu-item size="md">
    
          Rename
        
  </cds-overflow-menu-item>
      
    
  </cds-overflow-menu-body>

    
    
  </cds-overflow-menu>
    
                
              </div>
            
  </cds-table-cell>
          
  </cds-table-row>
          <cds-table-expanded-row colspan="1">
    
            
              
      <h6>Expandable row content</h6>
      <div>Expandable content for Load Balancer 3</div>
    
            
          
  </cds-table-expanded-row>
        
          <cds-table-row batch-expansion selection-label="Select row" selection-name="carbon-events" selection-value="2" id="2" data-row-id="2">
    
            
              
      
        <cds-ai-label ai-text="AI" alignment="bottom-start" alignment-axis-offset="0" button-label="Show information" kind="" revert-label="Revert to AI input" size="xs" slot="ai-label">
    
    <div slot="body-text">
      
      <p class="secondary">AI Explained</p>
      <h2 class="ai-label-heading">84%</h2>
      <p class="secondary bold">Confidence score</p>
      <p class="secondary">Model type: Foundation</p>
    
    </div>
    
    
      <cds-ai-label-action-button kind="primary" link-role="button" size="lg" slot="actions" tab-index="0" tooltip-alignment="" tooltip-position="top" type="button">
    
        View literature
      
  </cds-ai-label-action-button>
    
    
    

    
    
  </cds-ai-label>
      
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
      Load Balancer 1
    
              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
      HTTP
    
              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
      443
    
              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
      Round robin
    
              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
      Maureen&#39;s VM Groups
    
              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
      Starting
    
              
  </cds-table-cell-content>
            
  </cds-table-cell>
            <cds-table-cell>
    
              <div>
                
                  
      <cds-overflow-menu align="top" close-on-activation enter-delay-ms="100" flipped index="1" kind="primary" leave-delay-ms="300" link-role="button" size="md" tab-index="0" toolbar-action tooltip-alignment="" tooltip-position="top" type="button">
    
    <span slot="icon">
      
          <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" width="auto" fill="currentColor" preserveAspectRatio="xMidYMid meet" aria-hidden>
    
    
    <circle cx="8" cy="16" r="2"/><circle cx="16" cy="16" r="2"/><circle cx="24" cy="16" r="2"/>

  </svg>
        
    </span>
    <span slot="tooltip-content">
      Options
    </span>
    <cds-overflow-menu-body direction="bottom" size="md">
    
      
        <cds-overflow-menu-item size="md">
    
          Stop app
        
  </cds-overflow-menu-item>
      
        <cds-overflow-menu-item size="md">
    
          Restart app
        
  </cds-overflow-menu-item>
      
        <cds-overflow-menu-item size="md">
    
          Rename
        
  </cds-overflow-menu-item>
      
    
  </cds-overflow-menu-body>

    
    
  </cds-overflow-menu>
    
                
              </div>
            
  </cds-table-cell>
          
  </cds-table-row>
          <cds-table-expanded-row colspan="1">
    
            
              
      <h6>Expandable row content</h6>
      <div>Expandable content for Load Balancer 1</div>
    
            
          
  </cds-table-expanded-row>
        
          <cds-table-row batch-expansion selection-label="Select row" selection-name="carbon-events" selection-value="3" id="3" data-row-id="3">
    
            
              
      
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
      Load Balancer 2
    
              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
      HTTP
    
              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
      80
    
              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
      DNS delegation
    
              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
      Andrew&#39;s VM Groups
    
              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
      Active
    
              
  </cds-table-cell-content>
            
  </cds-table-cell>
            <cds-table-cell>
    
              <div>
                
                  
      <cds-overflow-menu align="top" close-on-activation enter-delay-ms="100" flipped index="1" kind="primary" leave-delay-ms="300" link-role="button" size="md" tab-index="0" toolbar-action tooltip-alignment="" tooltip-position="top" type="button">
    
    <span slot="icon">
      
          <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" width="auto" fill="currentColor" preserveAspectRatio="xMidYMid meet" aria-hidden>
    
    
    <circle cx="8" cy="16" r="2"/><circle cx="16" cy="16" r="2"/><circle cx="24" cy="16" r="2"/>

  </svg>
        
    </span>
    <span slot="tooltip-content">
      Options
    </span>
    <cds-overflow-menu-body direction="bottom" size="md">
    
      
        <cds-overflow-menu-item size="md">
    
          Stop app
        
  </cds-overflow-menu-item>
      
        <cds-overflow-menu-item size="md">
    
          Restart app
        
  </cds-overflow-menu-item>
      
        <cds-overflow-menu-item size="md">
    
          Rename
        
  </cds-overflow-menu-item>
      
    
  </cds-overflow-menu-body>

    
    
  </cds-overflow-menu>
    
                
              </div>
            
  </cds-table-cell>
          
  </cds-table-row>
          <cds-table-expanded-row colspan="1">
    
            
              
      <h6>Expandable row content</h6>
      <div>Expandable content for Load Balancer 2</div>
    
            
          
  </cds-table-expanded-row>
        
          <cds-table-row batch-expansion selection-label="Select row" selection-name="carbon-events" selection-value="4" id="4" data-row-id="4">
    
            
              
      
        <cds-ai-label ai-text="AI" alignment="bottom-start" alignment-axis-offset="0" button-label="Show information" kind="" revert-label="Revert to AI input" size="xs" slot="ai-label">
    
    <div slot="body-text">
      
      <p class="secondary">AI Explained</p>
      <h2 class="ai-label-heading">84%</h2>
      <p class="secondary bold">Confidence score</p>
      <p class="secondary">Model type: Foundation</p>
    
    </div>
    
    
      <cds-ai-label-action-button kind="primary" link-role="button" size="lg" slot="actions" tab-index="0" tooltip-alignment="" tooltip-position="top" type="button">
    
        View literature
      
  </cds-ai-label-action-button>
    
    
    

    
    
  </cds-ai-label>
      
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
      Load Balancer 6
    
              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
      HTTP
    
              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
      3000
    
              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
      Round robin
    
              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
      Marc&#39;s VM Groups
    
              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
      Disabled
    
              
  </cds-table-cell-content>
            
  </cds-table-cell>
            <cds-table-cell>
    
              <div>
                
                  
      <cds-overflow-menu align="top" close-on-activation enter-delay-ms="100" flipped index="1" kind="primary" leave-delay-ms="300" link-role="button" size="md" tab-index="0" toolbar-action tooltip-alignment="" tooltip-position="top" type="button">
    
    <span slot="icon">
      
          <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" width="auto" fill="currentColor" preserveAspectRatio="xMidYMid meet" aria-hidden>
    
    
    <circle cx="8" cy="16" r="2"/><circle cx="16" cy="16" r="2"/><circle cx="24" cy="16" r="2"/>

  </svg>
        
    </span>
    <span slot="tooltip-content">
      Options
    </span>
    <cds-overflow-menu-body direction="bottom" size="md">
    
      
        <cds-overflow-menu-item size="md">
    
          Stop app
        
  </cds-overflow-menu-item>
      
        <cds-overflow-menu-item size="md">
    
          Restart app
        
  </cds-overflow-menu-item>
      
        <cds-overflow-menu-item size="md">
    
          Rename
        
  </cds-overflow-menu-item>
      
    
  </cds-overflow-menu-body>

    
    
  </cds-overflow-menu>
    
                
              </div>
            
  </cds-table-cell>
          
  </cds-table-row>
          <cds-table-expanded-row colspan="1">
    
            
              
      <h6>Expandable row content</h6>
      <div>Expandable content for Load Balancer 6</div>
    
            
          
  </cds-table-expanded-row>
        
          <cds-table-row batch-expansion selection-label="Select row" selection-name="carbon-events" selection-value="5" id="5" data-row-id="5">
    
            
              
      
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
      Load Balancer 4
    
              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
      HTTP
    
              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
      443
    
              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
      Round robin
    
              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
      Mel&#39;s VM Groups
    
              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
      Starting
    
              
  </cds-table-cell-content>
            
  </cds-table-cell>
            <cds-table-cell>
    
              <div>
                
                  
      <cds-overflow-menu align="top" close-on-activation enter-delay-ms="100" flipped index="1" kind="primary" leave-delay-ms="300" link-role="button" size="md" tab-index="0" toolbar-action tooltip-alignment="" tooltip-position="top" type="button">
    
    <span slot="icon">
      
          <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" width="auto" fill="currentColor" preserveAspectRatio="xMidYMid meet" aria-hidden>
    
    
    <circle cx="8" cy="16" r="2"/><circle cx="16" cy="16" r="2"/><circle cx="24" cy="16" r="2"/>

  </svg>
        
    </span>
    <span slot="tooltip-content">
      Options
    </span>
    <cds-overflow-menu-body direction="bottom" size="md">
    
      
        <cds-overflow-menu-item size="md">
    
          Stop app
        
  </cds-overflow-menu-item>
      
        <cds-overflow-menu-item size="md">
    
          Restart app
        
  </cds-overflow-menu-item>
      
        <cds-overflow-menu-item size="md">
    
          Rename
        
  </cds-overflow-menu-item>
      
    
  </cds-overflow-menu-body>

    
    
  </cds-overflow-menu>
    
                
              </div>
            
  </cds-table-cell>
          
  </cds-table-row>
          <cds-table-expanded-row colspan="1">
    
            
              
      <h6>Expandable row content</h6>
      <div>Expandable content for Load Balancer 4</div>
    
            
          
  </cds-table-expanded-row>
        
          <cds-table-row batch-expansion selection-label="Select row" selection-name="carbon-events" selection-value="6" id="6" data-row-id="6">
    
            
              
      
        <cds-ai-label ai-text="AI" alignment="bottom-start" alignment-axis-offset="0" button-label="Show information" kind="" revert-label="Revert to AI input" size="xs" slot="ai-label">
    
    <div slot="body-text">
      
      <p class="secondary">AI Explained</p>
      <h2 class="ai-label-heading">84%</h2>
      <p class="secondary bold">Confidence score</p>
      <p class="secondary">Model type: Foundation</p>
    
    </div>
    
    
      <cds-ai-label-action-button kind="primary" link-role="button" size="lg" slot="actions" tab-index="0" tooltip-alignment="" tooltip-position="top" type="button">
    
        View literature
      
  </cds-ai-label-action-button>
    
    
    

    
    
  </cds-ai-label>
      
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
      Load Balancer 5
    
              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
      HTTP
    
              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
      80
    
              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
      DNS delegation
    
              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
      Ronja&#39;s VM Groups
    
              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
      Active
    
              
  </cds-table-cell-content>
            
  </cds-table-cell>
            <cds-table-cell>
    
              <div>
                
                  
      <cds-overflow-menu align="top" close-on-activation enter-delay-ms="100" flipped index="1" kind="primary" leave-delay-ms="300" link-role="button" size="md" tab-index="0" toolbar-action tooltip-alignment="" tooltip-position="top" type="button">
    
    <span slot="icon">
      
          <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" width="auto" fill="currentColor" preserveAspectRatio="xMidYMid meet" aria-hidden>
    
    
    <circle cx="8" cy="16" r="2"/><circle cx="16" cy="16" r="2"/><circle cx="24" cy="16" r="2"/>

  </svg>
        
    </span>
    <span slot="tooltip-content">
      Options
    </span>
    <cds-overflow-menu-body direction="bottom" size="md">
    
      
        <cds-overflow-menu-item size="md">
    
          Stop app
        
  </cds-overflow-menu-item>
      
        <cds-overflow-menu-item size="md">
    
          Restart app
        
  </cds-overflow-menu-item>
      
        <cds-overflow-menu-item size="md">
    
          Rename
        
  </cds-overflow-menu-item>
      
    
  </cds-overflow-menu-body>

    
    
  </cds-overflow-menu>
    
                
              </div>
            
  </cds-table-cell>
          
  </cds-table-row>
          <cds-table-expanded-row colspan="1">
    
            
              
      <h6>Expandable row content</h6>
      <div>Expandable content for Load Balancer 5</div>
    
            
          
  </cds-table-expanded-row>
        
      
  </cds-table-body>
    
    <div slot="title">
      
        <cds-table-header-title>
    
          DataTable
        
  </cds-table-header-title>
      
    </div>
    <div slot="description">
      
        <cds-table-header-description>
    
          Advanced interactivity with callbacks
        
  </cds-table-header-description>
      
    </div>
    <div slot="toolbar">
      
      <cds-table-toolbar>
    
        <cds-table-batch-actions selected-rows-count="0" size="lg" total-rows-count="6">
    
          <cds-button kind="ghost" link-role="button" size="lg" tab-index="0" tooltip-alignment="" tooltip-position="top" type="button">
    Delete
    
  </cds-button>
          <cds-button kind="ghost" link-role="button" size="lg" tab-index="0" tooltip-alignment="" tooltip-position="top" type="button">
    Save
    
  </cds-button>
          <cds-button href="#" kind="ghost" link-role="button" size="lg" tab-index="0" tooltip-alignment="" tooltip-position="top" type="button">
    Download
    
  </cds-button>
        
  </cds-table-batch-actions>
        <cds-table-toolbar-content has-batch-actions>
    
          <cds-table-toolbar-search autocomplete="off" placeholder="Filter table" size="lg">
    
  </cds-table-toolbar-search>
          <cds-overflow-menu align="top" close-on-activation enter-delay-ms="100" index="1" kind="primary" leave-delay-ms="300" link-role="button" size="md" tab-index="0" toolbar-action tooltip-alignment="" tooltip-position="top" type="button">
    
    <span slot="icon">
      
              <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" width="auto" fill="currentColor" preserveAspectRatio="xMidYMid meet" aria-hidden>
    
    
    <circle cx="8" cy="16" r="2"/><circle cx="16" cy="16" r="2"/><circle cx="24" cy="16" r="2"/>

  </svg>
            
    </span>
    <span slot="tooltip-content">
      Settings
    </span>
    <cds-overflow-menu-body direction="bottom" size="md">
    
      
        <cds-overflow-menu-item size="md">
    
          Action 1
        
  </cds-overflow-menu-item>
      
        <cds-overflow-menu-item size="md">
    
          Action 2
        
  </cds-overflow-menu-item>
      
        <cds-overflow-menu-item size="md">
    
          Action 3
        
  </cds-overflow-menu-item>
      
    
  </cds-overflow-menu-body>

    
    
  </cds-overflow-menu>
          <cds-button kind="primary" link-role="button" size="lg" tab-index="0" tooltip-alignment="" tooltip-position="top" type="button">
    Add new
    
  </cds-button>
        
  </cds-table-toolbar-content>
      
  </cds-table-toolbar>
    
    </div>
  </cds-table>
  </div>

  <h4>Event log</h4>
  <pre id="carbon-events-log">
    
  </pre>

  <h4>Callback controls</h4>
  <p>These buttons dispatch the same events as the built-in controls.</p>
  <div id="carbon-events-simulator">
    
      <cds-button kind="tertiary" link-role="button" size="lg" tab-index="0" tooltip-alignment="" tooltip-position="top" type="button" phx-click="[[&quot;dispatch&quot;,{&quot;to&quot;:&quot;#carbon-events-table&quot;,&quot;detail&quot;:{&quot;selected&quot;:true,&quot;action&quot;:&quot;select_row&quot;,&quot;row_id&quot;:&quot;row-2&quot;},&quot;event&quot;:&quot;graphene:table-simulate&quot;}]]">
    
        Select row 2
      
    
  </cds-button>
    
      <cds-button kind="tertiary" link-role="button" size="lg" tab-index="0" tooltip-alignment="" tooltip-position="top" type="button" phx-click="[[&quot;dispatch&quot;,{&quot;to&quot;:&quot;#carbon-events-table&quot;,&quot;detail&quot;:{&quot;action&quot;:&quot;select_none&quot;},&quot;event&quot;:&quot;graphene:table-simulate&quot;}]]">
    
        Clear selection
      
    
  </cds-button>
    
      <cds-button kind="tertiary" link-role="button" size="lg" tab-index="0" tooltip-alignment="" tooltip-position="top" type="button" phx-click="[[&quot;dispatch&quot;,{&quot;to&quot;:&quot;#carbon-events-table&quot;,&quot;detail&quot;:{&quot;selected&quot;:true,&quot;action&quot;:&quot;select_all&quot;},&quot;event&quot;:&quot;graphene:table-simulate&quot;}]]">
    
        Select all
      
    
  </cds-button>
    
      <cds-button kind="tertiary" link-role="button" size="lg" tab-index="0" tooltip-alignment="" tooltip-position="top" type="button" phx-click="[[&quot;dispatch&quot;,{&quot;to&quot;:&quot;#carbon-events-table&quot;,&quot;detail&quot;:{&quot;action&quot;:&quot;sort&quot;,&quot;direction&quot;:&quot;ascending&quot;,&quot;column_index&quot;:0},&quot;event&quot;:&quot;graphene:table-simulate&quot;}]]">
    
        Sort by name (asc)
      
    
  </cds-button>
    
      <cds-button kind="tertiary" link-role="button" size="lg" tab-index="0" tooltip-alignment="" tooltip-position="top" type="button" phx-click="[[&quot;dispatch&quot;,{&quot;to&quot;:&quot;#carbon-events-table&quot;,&quot;detail&quot;:{&quot;action&quot;:&quot;sort&quot;,&quot;direction&quot;:&quot;descending&quot;,&quot;column_index&quot;:0},&quot;event&quot;:&quot;graphene:table-simulate&quot;}]]">
    
        Sort by name (desc)
      
    
  </cds-button>
    
      <cds-button kind="tertiary" link-role="button" size="lg" tab-index="0" tooltip-alignment="" tooltip-position="top" type="button" phx-click="[[&quot;dispatch&quot;,{&quot;to&quot;:&quot;#carbon-events-table&quot;,&quot;detail&quot;:{&quot;value&quot;:&quot;Balancer 1&quot;,&quot;action&quot;:&quot;search&quot;},&quot;event&quot;:&quot;graphene:table-simulate&quot;}]]">
    
        Search &#39;Balancer 1&#39;
      
    
  </cds-button>
    
      <cds-button kind="tertiary" link-role="button" size="lg" tab-index="0" tooltip-alignment="" tooltip-position="top" type="button" phx-click="[[&quot;dispatch&quot;,{&quot;to&quot;:&quot;#carbon-events-table&quot;,&quot;detail&quot;:{&quot;value&quot;:&quot;&quot;,&quot;action&quot;:&quot;search&quot;},&quot;event&quot;:&quot;graphene:table-simulate&quot;}]]">
    
        Clear search
      
    
  </cds-button>
    
  </div>
  ```


  #### overflow_menu_small

  ##### small

  ```heex
  <.data_table
    id="overflow-menu-small-single-small"
    size="sm"
    rows={[%{id: 1, name: "Load Balancer 3", port: "3000", status: "Disabled", protocol: "HTTP", group: "Kevin's VM Groups", rule: "Round robin"}, %{id: 2, name: "Load Balancer 1", port: "443", status: "Starting", protocol: "HTTP", group: "Maureen's VM Groups", rule: "Round robin"}, %{id: 3, name: "Load Balancer 2", port: "80", status: "Active", protocol: "HTTP", group: "Andrew's VM Groups", rule: "DNS delegation"}, %{id: 4, name: "Load Balancer 6", port: "3000", status: "Disabled", protocol: "HTTP", group: "Marc's VM Groups", rule: "Round robin"}, %{id: 5, name: "Load Balancer 4", port: "443", status: "Starting", protocol: "HTTP", group: "Mel's VM Groups", rule: "Round robin"}, %{id: 6, name: "Load Balancer 5", port: "80", status: "Active", protocol: "HTTP", group: "Ronja's VM Groups", rule: "DNS delegation"}]}
    row_id={&Graphene.CarbonComponents.DataTable.Shared.row_id/1}
    overflow_menu_on_hover
  >
    <:title>DataTable</:title>
    <:description>Small overflow menu</:description>
    <:toolbar>
      <Graphene.CarbonComponents.table_toolbar>
        <Graphene.CarbonComponents.table_toolbar_content>
          <Graphene.CarbonComponents.table_toolbar_search placeholder="Filter table" />
          <Graphene.CarbonComponents.button>Primary button</Graphene.CarbonComponents.button>
        </Graphene.CarbonComponents.table_toolbar_content>
      </Graphene.CarbonComponents.table_toolbar>
    </:toolbar>
    <:col :for={col <- Storybook.CarbonComponents.DataTable.Shared.columns()} :let={row} label={col.label}>
      <%= Map.get(row, col.key) %>
    </:col>
    <:action :let={_row}>
      <Graphene.CarbonComponents.overflow_menu toolbar_action flipped>
        <:icon>
          <Storybook.CarbonComponents.DataTable.Shared.overflow_icon />
        </:icon>
        <:tooltip_content>Options</:tooltip_content>
        <:item>Stop app</:item>
        <:item>Restart app</:item>
        <:item>Rename</:item>
      </Graphene.CarbonComponents.overflow_menu>
    </:action>
  </.data_table>
  ```

  ```html
  <div id="overflow-menu-small-single-small-component">
    <cds-table headerCount="0" locale="en" overflow-menu-on-hover size="sm" use-zebra-styles id="overflow-menu-small-single-small" phx-hook="BasicComponentsTable" data-selected-ids="" phx-target="1" phx-update="ignore">
    
      <cds-table-head>
    
        <cds-table-header-row>
    
          <cds-table-header-cell data-col-index="0">
    
            Name
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="1">
    
            Protocol
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="2">
    
            Port
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="3">
    
            Rule
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="4">
    
            Attached groups
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="5">
    
            Status
          
  </cds-table-header-cell>
          <cds-table-header-cell>
    
            <span class="sr-only">Actions</span>
          
  </cds-table-header-cell>
        
  </cds-table-header-row>
      
  </cds-table-head>
      <cds-table-body id="overflow-menu-small-single-smallbody">
    
        
          <cds-table-row id="1" data-row-id="1">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 3

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    3000

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Kevin&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Disabled

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            <cds-table-cell>
    
              <div>
                
                  
    <cds-overflow-menu align="top" close-on-activation enter-delay-ms="100" flipped index="1" kind="primary" leave-delay-ms="300" link-role="button" size="md" tab-index="0" toolbar-action tooltip-alignment="" tooltip-position="top" type="button">
    
    <span slot="icon">
      
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" width="auto" fill="currentColor" preserveAspectRatio="xMidYMid meet" aria-hidden>
    
    
    <circle cx="8" cy="16" r="2"/><circle cx="16" cy="16" r="2"/><circle cx="24" cy="16" r="2"/>

  </svg>
      
    </span>
    <span slot="tooltip-content">
      Options
    </span>
    <cds-overflow-menu-body direction="bottom" size="md">
    
      
        <cds-overflow-menu-item size="md">
    
          Stop app
        
  </cds-overflow-menu-item>
      
        <cds-overflow-menu-item size="md">
    
          Restart app
        
  </cds-overflow-menu-item>
      
        <cds-overflow-menu-item size="md">
    
          Rename
        
  </cds-overflow-menu-item>
      
    
  </cds-overflow-menu-body>

    
    
  </cds-overflow-menu>

                
              </div>
            
  </cds-table-cell>
          
  </cds-table-row>
          
        
          <cds-table-row id="2" data-row-id="2">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 1

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    443

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Maureen&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Starting

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            <cds-table-cell>
    
              <div>
                
                  
    <cds-overflow-menu align="top" close-on-activation enter-delay-ms="100" flipped index="1" kind="primary" leave-delay-ms="300" link-role="button" size="md" tab-index="0" toolbar-action tooltip-alignment="" tooltip-position="top" type="button">
    
    <span slot="icon">
      
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" width="auto" fill="currentColor" preserveAspectRatio="xMidYMid meet" aria-hidden>
    
    
    <circle cx="8" cy="16" r="2"/><circle cx="16" cy="16" r="2"/><circle cx="24" cy="16" r="2"/>

  </svg>
      
    </span>
    <span slot="tooltip-content">
      Options
    </span>
    <cds-overflow-menu-body direction="bottom" size="md">
    
      
        <cds-overflow-menu-item size="md">
    
          Stop app
        
  </cds-overflow-menu-item>
      
        <cds-overflow-menu-item size="md">
    
          Restart app
        
  </cds-overflow-menu-item>
      
        <cds-overflow-menu-item size="md">
    
          Rename
        
  </cds-overflow-menu-item>
      
    
  </cds-overflow-menu-body>

    
    
  </cds-overflow-menu>

                
              </div>
            
  </cds-table-cell>
          
  </cds-table-row>
          
        
          <cds-table-row id="3" data-row-id="3">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 2

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    80

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    DNS delegation

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Andrew&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Active

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            <cds-table-cell>
    
              <div>
                
                  
    <cds-overflow-menu align="top" close-on-activation enter-delay-ms="100" flipped index="1" kind="primary" leave-delay-ms="300" link-role="button" size="md" tab-index="0" toolbar-action tooltip-alignment="" tooltip-position="top" type="button">
    
    <span slot="icon">
      
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" width="auto" fill="currentColor" preserveAspectRatio="xMidYMid meet" aria-hidden>
    
    
    <circle cx="8" cy="16" r="2"/><circle cx="16" cy="16" r="2"/><circle cx="24" cy="16" r="2"/>

  </svg>
      
    </span>
    <span slot="tooltip-content">
      Options
    </span>
    <cds-overflow-menu-body direction="bottom" size="md">
    
      
        <cds-overflow-menu-item size="md">
    
          Stop app
        
  </cds-overflow-menu-item>
      
        <cds-overflow-menu-item size="md">
    
          Restart app
        
  </cds-overflow-menu-item>
      
        <cds-overflow-menu-item size="md">
    
          Rename
        
  </cds-overflow-menu-item>
      
    
  </cds-overflow-menu-body>

    
    
  </cds-overflow-menu>

                
              </div>
            
  </cds-table-cell>
          
  </cds-table-row>
          
        
          <cds-table-row id="4" data-row-id="4">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 6

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    3000

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Marc&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Disabled

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            <cds-table-cell>
    
              <div>
                
                  
    <cds-overflow-menu align="top" close-on-activation enter-delay-ms="100" flipped index="1" kind="primary" leave-delay-ms="300" link-role="button" size="md" tab-index="0" toolbar-action tooltip-alignment="" tooltip-position="top" type="button">
    
    <span slot="icon">
      
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" width="auto" fill="currentColor" preserveAspectRatio="xMidYMid meet" aria-hidden>
    
    
    <circle cx="8" cy="16" r="2"/><circle cx="16" cy="16" r="2"/><circle cx="24" cy="16" r="2"/>

  </svg>
      
    </span>
    <span slot="tooltip-content">
      Options
    </span>
    <cds-overflow-menu-body direction="bottom" size="md">
    
      
        <cds-overflow-menu-item size="md">
    
          Stop app
        
  </cds-overflow-menu-item>
      
        <cds-overflow-menu-item size="md">
    
          Restart app
        
  </cds-overflow-menu-item>
      
        <cds-overflow-menu-item size="md">
    
          Rename
        
  </cds-overflow-menu-item>
      
    
  </cds-overflow-menu-body>

    
    
  </cds-overflow-menu>

                
              </div>
            
  </cds-table-cell>
          
  </cds-table-row>
          
        
          <cds-table-row id="5" data-row-id="5">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 4

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    443

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Mel&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Starting

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            <cds-table-cell>
    
              <div>
                
                  
    <cds-overflow-menu align="top" close-on-activation enter-delay-ms="100" flipped index="1" kind="primary" leave-delay-ms="300" link-role="button" size="md" tab-index="0" toolbar-action tooltip-alignment="" tooltip-position="top" type="button">
    
    <span slot="icon">
      
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" width="auto" fill="currentColor" preserveAspectRatio="xMidYMid meet" aria-hidden>
    
    
    <circle cx="8" cy="16" r="2"/><circle cx="16" cy="16" r="2"/><circle cx="24" cy="16" r="2"/>

  </svg>
      
    </span>
    <span slot="tooltip-content">
      Options
    </span>
    <cds-overflow-menu-body direction="bottom" size="md">
    
      
        <cds-overflow-menu-item size="md">
    
          Stop app
        
  </cds-overflow-menu-item>
      
        <cds-overflow-menu-item size="md">
    
          Restart app
        
  </cds-overflow-menu-item>
      
        <cds-overflow-menu-item size="md">
    
          Rename
        
  </cds-overflow-menu-item>
      
    
  </cds-overflow-menu-body>

    
    
  </cds-overflow-menu>

                
              </div>
            
  </cds-table-cell>
          
  </cds-table-row>
          
        
          <cds-table-row id="6" data-row-id="6">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 5

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    80

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    DNS delegation

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Ronja&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Active

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            <cds-table-cell>
    
              <div>
                
                  
    <cds-overflow-menu align="top" close-on-activation enter-delay-ms="100" flipped index="1" kind="primary" leave-delay-ms="300" link-role="button" size="md" tab-index="0" toolbar-action tooltip-alignment="" tooltip-position="top" type="button">
    
    <span slot="icon">
      
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" width="auto" fill="currentColor" preserveAspectRatio="xMidYMid meet" aria-hidden>
    
    
    <circle cx="8" cy="16" r="2"/><circle cx="16" cy="16" r="2"/><circle cx="24" cy="16" r="2"/>

  </svg>
      
    </span>
    <span slot="tooltip-content">
      Options
    </span>
    <cds-overflow-menu-body direction="bottom" size="md">
    
      
        <cds-overflow-menu-item size="md">
    
          Stop app
        
  </cds-overflow-menu-item>
      
        <cds-overflow-menu-item size="md">
    
          Restart app
        
  </cds-overflow-menu-item>
      
        <cds-overflow-menu-item size="md">
    
          Rename
        
  </cds-overflow-menu-item>
      
    
  </cds-overflow-menu-body>

    
    
  </cds-overflow-menu>

                
              </div>
            
  </cds-table-cell>
          
  </cds-table-row>
          
        
      
  </cds-table-body>
    
    <div slot="title">
      
        <cds-table-header-title>
    
          DataTable
        
  </cds-table-header-title>
      
    </div>
    <div slot="description">
      
        <cds-table-header-description>
    
          Small overflow menu
        
  </cds-table-header-description>
      
    </div>
    <div slot="toolbar">
      
    <cds-table-toolbar>
    
      <cds-table-toolbar-content>
    
        <cds-table-toolbar-search autocomplete="off" placeholder="Filter table" size="lg">
    
  </cds-table-toolbar-search>
        <cds-button kind="primary" link-role="button" size="lg" tab-index="0" tooltip-alignment="" tooltip-position="top" type="button">
    Primary button
    
  </cds-button>
      
  </cds-table-toolbar-content>
    
  </cds-table-toolbar>

    </div>
  </cds-table>
  </div>
  ```

  ##### extra_small

  ```heex
  <.data_table
    id="overflow-menu-small-single-extra-small"
    size="xs"
    rows={[%{id: 1, name: "Load Balancer 3", port: "3000", status: "Disabled", protocol: "HTTP", group: "Kevin's VM Groups", rule: "Round robin"}, %{id: 2, name: "Load Balancer 1", port: "443", status: "Starting", protocol: "HTTP", group: "Maureen's VM Groups", rule: "Round robin"}, %{id: 3, name: "Load Balancer 2", port: "80", status: "Active", protocol: "HTTP", group: "Andrew's VM Groups", rule: "DNS delegation"}, %{id: 4, name: "Load Balancer 6", port: "3000", status: "Disabled", protocol: "HTTP", group: "Marc's VM Groups", rule: "Round robin"}, %{id: 5, name: "Load Balancer 4", port: "443", status: "Starting", protocol: "HTTP", group: "Mel's VM Groups", rule: "Round robin"}, %{id: 6, name: "Load Balancer 5", port: "80", status: "Active", protocol: "HTTP", group: "Ronja's VM Groups", rule: "DNS delegation"}]}
    row_id={&Graphene.CarbonComponents.DataTable.Shared.row_id/1}
    overflow_menu_on_hover
  >
    <:title>DataTable</:title>
    <:description>Extra small overflow</:description>
    <:toolbar>
      <Graphene.CarbonComponents.table_toolbar>
        <Graphene.CarbonComponents.table_toolbar_content>
          <Graphene.CarbonComponents.table_toolbar_search placeholder="Filter table" />
        </Graphene.CarbonComponents.table_toolbar_content>
      </Graphene.CarbonComponents.table_toolbar>
    </:toolbar>
    <:col :for={col <- Storybook.CarbonComponents.DataTable.Shared.columns()} :let={row} label={col.label}>
      <%= Map.get(row, col.key) %>
    </:col>
    <:action :let={_row}>
      <Graphene.CarbonComponents.overflow_menu toolbar_action flipped>
        <:icon>
          <Storybook.CarbonComponents.DataTable.Shared.overflow_icon />
        </:icon>
        <:tooltip_content>Options</:tooltip_content>
        <:item>Stop app</:item>
        <:item>Restart app</:item>
      </Graphene.CarbonComponents.overflow_menu>
    </:action>
  </.data_table>
  ```

  ```html
  <div id="overflow-menu-small-single-extra-small-component">
    <cds-table headerCount="0" locale="en" overflow-menu-on-hover size="xs" use-zebra-styles id="overflow-menu-small-single-extra-small" phx-hook="BasicComponentsTable" data-selected-ids="" phx-target="1" phx-update="ignore">
    
      <cds-table-head>
    
        <cds-table-header-row>
    
          <cds-table-header-cell data-col-index="0">
    
            Name
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="1">
    
            Protocol
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="2">
    
            Port
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="3">
    
            Rule
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="4">
    
            Attached groups
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="5">
    
            Status
          
  </cds-table-header-cell>
          <cds-table-header-cell>
    
            <span class="sr-only">Actions</span>
          
  </cds-table-header-cell>
        
  </cds-table-header-row>
      
  </cds-table-head>
      <cds-table-body id="overflow-menu-small-single-extra-smallbody">
    
        
          <cds-table-row id="1" data-row-id="1">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 3

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    3000

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Kevin&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Disabled

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            <cds-table-cell>
    
              <div>
                
                  
    <cds-overflow-menu align="top" close-on-activation enter-delay-ms="100" flipped index="1" kind="primary" leave-delay-ms="300" link-role="button" size="md" tab-index="0" toolbar-action tooltip-alignment="" tooltip-position="top" type="button">
    
    <span slot="icon">
      
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" width="auto" fill="currentColor" preserveAspectRatio="xMidYMid meet" aria-hidden>
    
    
    <circle cx="8" cy="16" r="2"/><circle cx="16" cy="16" r="2"/><circle cx="24" cy="16" r="2"/>

  </svg>
      
    </span>
    <span slot="tooltip-content">
      Options
    </span>
    <cds-overflow-menu-body direction="bottom" size="md">
    
      
        <cds-overflow-menu-item size="md">
    
          Stop app
        
  </cds-overflow-menu-item>
      
        <cds-overflow-menu-item size="md">
    
          Restart app
        
  </cds-overflow-menu-item>
      
    
  </cds-overflow-menu-body>

    
    
  </cds-overflow-menu>

                
              </div>
            
  </cds-table-cell>
          
  </cds-table-row>
          
        
          <cds-table-row id="2" data-row-id="2">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 1

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    443

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Maureen&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Starting

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            <cds-table-cell>
    
              <div>
                
                  
    <cds-overflow-menu align="top" close-on-activation enter-delay-ms="100" flipped index="1" kind="primary" leave-delay-ms="300" link-role="button" size="md" tab-index="0" toolbar-action tooltip-alignment="" tooltip-position="top" type="button">
    
    <span slot="icon">
      
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" width="auto" fill="currentColor" preserveAspectRatio="xMidYMid meet" aria-hidden>
    
    
    <circle cx="8" cy="16" r="2"/><circle cx="16" cy="16" r="2"/><circle cx="24" cy="16" r="2"/>

  </svg>
      
    </span>
    <span slot="tooltip-content">
      Options
    </span>
    <cds-overflow-menu-body direction="bottom" size="md">
    
      
        <cds-overflow-menu-item size="md">
    
          Stop app
        
  </cds-overflow-menu-item>
      
        <cds-overflow-menu-item size="md">
    
          Restart app
        
  </cds-overflow-menu-item>
      
    
  </cds-overflow-menu-body>

    
    
  </cds-overflow-menu>

                
              </div>
            
  </cds-table-cell>
          
  </cds-table-row>
          
        
          <cds-table-row id="3" data-row-id="3">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 2

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    80

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    DNS delegation

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Andrew&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Active

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            <cds-table-cell>
    
              <div>
                
                  
    <cds-overflow-menu align="top" close-on-activation enter-delay-ms="100" flipped index="1" kind="primary" leave-delay-ms="300" link-role="button" size="md" tab-index="0" toolbar-action tooltip-alignment="" tooltip-position="top" type="button">
    
    <span slot="icon">
      
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" width="auto" fill="currentColor" preserveAspectRatio="xMidYMid meet" aria-hidden>
    
    
    <circle cx="8" cy="16" r="2"/><circle cx="16" cy="16" r="2"/><circle cx="24" cy="16" r="2"/>

  </svg>
      
    </span>
    <span slot="tooltip-content">
      Options
    </span>
    <cds-overflow-menu-body direction="bottom" size="md">
    
      
        <cds-overflow-menu-item size="md">
    
          Stop app
        
  </cds-overflow-menu-item>
      
        <cds-overflow-menu-item size="md">
    
          Restart app
        
  </cds-overflow-menu-item>
      
    
  </cds-overflow-menu-body>

    
    
  </cds-overflow-menu>

                
              </div>
            
  </cds-table-cell>
          
  </cds-table-row>
          
        
          <cds-table-row id="4" data-row-id="4">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 6

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    3000

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Marc&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Disabled

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            <cds-table-cell>
    
              <div>
                
                  
    <cds-overflow-menu align="top" close-on-activation enter-delay-ms="100" flipped index="1" kind="primary" leave-delay-ms="300" link-role="button" size="md" tab-index="0" toolbar-action tooltip-alignment="" tooltip-position="top" type="button">
    
    <span slot="icon">
      
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" width="auto" fill="currentColor" preserveAspectRatio="xMidYMid meet" aria-hidden>
    
    
    <circle cx="8" cy="16" r="2"/><circle cx="16" cy="16" r="2"/><circle cx="24" cy="16" r="2"/>

  </svg>
      
    </span>
    <span slot="tooltip-content">
      Options
    </span>
    <cds-overflow-menu-body direction="bottom" size="md">
    
      
        <cds-overflow-menu-item size="md">
    
          Stop app
        
  </cds-overflow-menu-item>
      
        <cds-overflow-menu-item size="md">
    
          Restart app
        
  </cds-overflow-menu-item>
      
    
  </cds-overflow-menu-body>

    
    
  </cds-overflow-menu>

                
              </div>
            
  </cds-table-cell>
          
  </cds-table-row>
          
        
          <cds-table-row id="5" data-row-id="5">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 4

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    443

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Mel&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Starting

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            <cds-table-cell>
    
              <div>
                
                  
    <cds-overflow-menu align="top" close-on-activation enter-delay-ms="100" flipped index="1" kind="primary" leave-delay-ms="300" link-role="button" size="md" tab-index="0" toolbar-action tooltip-alignment="" tooltip-position="top" type="button">
    
    <span slot="icon">
      
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" width="auto" fill="currentColor" preserveAspectRatio="xMidYMid meet" aria-hidden>
    
    
    <circle cx="8" cy="16" r="2"/><circle cx="16" cy="16" r="2"/><circle cx="24" cy="16" r="2"/>

  </svg>
      
    </span>
    <span slot="tooltip-content">
      Options
    </span>
    <cds-overflow-menu-body direction="bottom" size="md">
    
      
        <cds-overflow-menu-item size="md">
    
          Stop app
        
  </cds-overflow-menu-item>
      
        <cds-overflow-menu-item size="md">
    
          Restart app
        
  </cds-overflow-menu-item>
      
    
  </cds-overflow-menu-body>

    
    
  </cds-overflow-menu>

                
              </div>
            
  </cds-table-cell>
          
  </cds-table-row>
          
        
          <cds-table-row id="6" data-row-id="6">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 5

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    80

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    DNS delegation

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Ronja&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Active

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            <cds-table-cell>
    
              <div>
                
                  
    <cds-overflow-menu align="top" close-on-activation enter-delay-ms="100" flipped index="1" kind="primary" leave-delay-ms="300" link-role="button" size="md" tab-index="0" toolbar-action tooltip-alignment="" tooltip-position="top" type="button">
    
    <span slot="icon">
      
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" width="auto" fill="currentColor" preserveAspectRatio="xMidYMid meet" aria-hidden>
    
    
    <circle cx="8" cy="16" r="2"/><circle cx="16" cy="16" r="2"/><circle cx="24" cy="16" r="2"/>

  </svg>
      
    </span>
    <span slot="tooltip-content">
      Options
    </span>
    <cds-overflow-menu-body direction="bottom" size="md">
    
      
        <cds-overflow-menu-item size="md">
    
          Stop app
        
  </cds-overflow-menu-item>
      
        <cds-overflow-menu-item size="md">
    
          Restart app
        
  </cds-overflow-menu-item>
      
    
  </cds-overflow-menu-body>

    
    
  </cds-overflow-menu>

                
              </div>
            
  </cds-table-cell>
          
  </cds-table-row>
          
        
      
  </cds-table-body>
    
    <div slot="title">
      
        <cds-table-header-title>
    
          DataTable
        
  </cds-table-header-title>
      
    </div>
    <div slot="description">
      
        <cds-table-header-description>
    
          Extra small overflow
        
  </cds-table-header-description>
      
    </div>
    <div slot="toolbar">
      
    <cds-table-toolbar>
    
      <cds-table-toolbar-content>
    
        <cds-table-toolbar-search autocomplete="off" placeholder="Filter table" size="lg">
    
  </cds-table-toolbar-search>
      
  </cds-table-toolbar-content>
    
  </cds-table-toolbar>

    </div>
  </cds-table>
  </div>
  ```


  #### selection

  ##### checkboxes

  ```heex
  <.data_table
    id="selection-single-checkboxes"
    rows={[%{id: 1, name: "Load Balancer 3", port: "3000", status: "Disabled", protocol: "HTTP", group: "Kevin's VM Groups", rule: "Round robin"}, %{id: 2, name: "Load Balancer 1", port: "443", status: "Starting", protocol: "HTTP", group: "Maureen's VM Groups", rule: "Round robin"}, %{id: 3, name: "Load Balancer 2", port: "80", status: "Active", protocol: "HTTP", group: "Andrew's VM Groups", rule: "DNS delegation"}, %{id: 4, name: "Load Balancer 6", port: "3000", status: "Disabled", protocol: "HTTP", group: "Marc's VM Groups", rule: "Round robin"}, %{id: 5, name: "Load Balancer 4", port: "443", status: "Starting", protocol: "HTTP", group: "Mel's VM Groups", rule: "Round robin"}, %{id: 6, name: "Load Balancer 5", port: "80", status: "Active", protocol: "HTTP", group: "Ronja's VM Groups", rule: "DNS delegation"}]}
    selection_name="carbon-selection"
    row_id={&Graphene.CarbonComponents.DataTable.Shared.row_id/1}
    selectable
  >
    <:title>DataTable</:title>
    <:description>Row selection</:description>
    <:col :for={col <- Storybook.CarbonComponents.DataTable.Shared.columns()} :let={row} label={col.label}>
      <%= Map.get(row, col.key) %>
    </:col>
  </.data_table>
  ```

  ```html
  <div id="selection-single-checkboxes-component">
    <cds-table headerCount="0" is-selectable locale="en" size="lg" use-zebra-styles id="selection-single-checkboxes" phx-hook="BasicComponentsTable" data-selected-ids="" phx-target="1" phx-update="ignore">
    
      <cds-table-head>
    
        <cds-table-header-row selection-label="Select all" selection-name="carbon-selection">
    
          <cds-table-header-cell data-col-index="0">
    
            Name
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="1">
    
            Protocol
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="2">
    
            Port
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="3">
    
            Rule
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="4">
    
            Attached groups
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="5">
    
            Status
          
  </cds-table-header-cell>
          
        
  </cds-table-header-row>
      
  </cds-table-head>
      <cds-table-body id="selection-single-checkboxesbody">
    
        
          <cds-table-row selection-label="Select row" selection-name="carbon-selection" selection-value="1" id="1" data-row-id="1">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 3

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    3000

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Kevin&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Disabled

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row selection-label="Select row" selection-name="carbon-selection" selection-value="2" id="2" data-row-id="2">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 1

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    443

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Maureen&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Starting

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row selection-label="Select row" selection-name="carbon-selection" selection-value="3" id="3" data-row-id="3">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 2

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    80

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    DNS delegation

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Andrew&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Active

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row selection-label="Select row" selection-name="carbon-selection" selection-value="4" id="4" data-row-id="4">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 6

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    3000

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Marc&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Disabled

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row selection-label="Select row" selection-name="carbon-selection" selection-value="5" id="5" data-row-id="5">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 4

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    443

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Mel&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Starting

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row selection-label="Select row" selection-name="carbon-selection" selection-value="6" id="6" data-row-id="6">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 5

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    80

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    DNS delegation

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Ronja&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Active

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
      
  </cds-table-body>
    
    <div slot="title">
      
        <cds-table-header-title>
    
          DataTable
        
  </cds-table-header-title>
      
    </div>
    <div slot="description">
      
        <cds-table-header-description>
    
          Row selection
        
  </cds-table-header-description>
      
    </div>
    
  </cds-table>
  </div>
  ```

  ##### preselected

  ```heex
  <.data_table
    id="selection-single-preselected"
    rows={[%{id: 1, name: "Load Balancer 3", port: "3000", status: "Disabled", protocol: "HTTP", group: "Kevin's VM Groups", rule: "Round robin"}, %{id: 2, name: "Load Balancer 1", port: "443", status: "Starting", protocol: "HTTP", group: "Maureen's VM Groups", rule: "Round robin"}, %{id: 3, name: "Load Balancer 2", port: "80", status: "Active", protocol: "HTTP", group: "Andrew's VM Groups", rule: "DNS delegation"}, %{id: 4, name: "Load Balancer 6", port: "3000", status: "Disabled", protocol: "HTTP", group: "Marc's VM Groups", rule: "Round robin"}, %{id: 5, name: "Load Balancer 4", port: "443", status: "Starting", protocol: "HTTP", group: "Mel's VM Groups", rule: "Round robin"}, %{id: 6, name: "Load Balancer 5", port: "80", status: "Active", protocol: "HTTP", group: "Ronja's VM Groups", rule: "DNS delegation"}]}
    selection_name="carbon-selection"
    selected_ids={[2]}
    row_id={&Graphene.CarbonComponents.DataTable.Shared.row_id/1}
    selectable
  >
    <:title>DataTable</:title>
    <:description>Preselected row</:description>
    <:col :for={col <- Storybook.CarbonComponents.DataTable.Shared.columns()} :let={row} label={col.label}>
      <%= Map.get(row, col.key) %>
    </:col>
  </.data_table>
  ```

  ```html
  <div id="selection-single-preselected-component">
    <cds-table headerCount="0" is-selectable locale="en" size="lg" use-zebra-styles id="selection-single-preselected" phx-hook="BasicComponentsTable" data-selected-ids="2" phx-target="1" phx-update="ignore">
    
      <cds-table-head>
    
        <cds-table-header-row selection-label="Select all" selection-name="carbon-selection">
    
          <cds-table-header-cell data-col-index="0">
    
            Name
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="1">
    
            Protocol
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="2">
    
            Port
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="3">
    
            Rule
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="4">
    
            Attached groups
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="5">
    
            Status
          
  </cds-table-header-cell>
          
        
  </cds-table-header-row>
      
  </cds-table-head>
      <cds-table-body id="selection-single-preselectedbody">
    
        
          <cds-table-row selection-label="Select row" selection-name="carbon-selection" selection-value="1" id="1" data-row-id="1">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 3

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    3000

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Kevin&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Disabled

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row selected selection-label="Select row" selection-name="carbon-selection" selection-value="2" id="2" data-row-id="2">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 1

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    443

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Maureen&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Starting

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row selection-label="Select row" selection-name="carbon-selection" selection-value="3" id="3" data-row-id="3">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 2

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    80

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    DNS delegation

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Andrew&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Active

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row selection-label="Select row" selection-name="carbon-selection" selection-value="4" id="4" data-row-id="4">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 6

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    3000

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Marc&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Disabled

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row selection-label="Select row" selection-name="carbon-selection" selection-value="5" id="5" data-row-id="5">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 4

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    443

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Mel&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Starting

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row selection-label="Select row" selection-name="carbon-selection" selection-value="6" id="6" data-row-id="6">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 5

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    80

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    DNS delegation

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Ronja&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Active

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
      
  </cds-table-body>
    
    <div slot="title">
      
        <cds-table-header-title>
    
          DataTable
        
  </cds-table-header-title>
      
    </div>
    <div slot="description">
      
        <cds-table-header-description>
    
          Preselected row
        
  </cds-table-header-description>
      
    </div>
    
  </cds-table>
  </div>
  ```


  #### selection_radio

  ##### radio

  ```heex
  <.data_table
    id="selection-radio-single-radio"
    rows={[%{id: 1, name: "Load Balancer 3", port: "3000", status: "Disabled", protocol: "HTTP", group: "Kevin's VM Groups", rule: "Round robin"}, %{id: 2, name: "Load Balancer 1", port: "443", status: "Starting", protocol: "HTTP", group: "Maureen's VM Groups", rule: "Round robin"}, %{id: 3, name: "Load Balancer 2", port: "80", status: "Active", protocol: "HTTP", group: "Andrew's VM Groups", rule: "DNS delegation"}, %{id: 4, name: "Load Balancer 6", port: "3000", status: "Disabled", protocol: "HTTP", group: "Marc's VM Groups", rule: "Round robin"}, %{id: 5, name: "Load Balancer 4", port: "443", status: "Starting", protocol: "HTTP", group: "Mel's VM Groups", rule: "Round robin"}, %{id: 6, name: "Load Balancer 5", port: "80", status: "Active", protocol: "HTTP", group: "Ronja's VM Groups", rule: "DNS delegation"}]}
    selection_name="carbon-radio-selection"
    row_id={&Graphene.CarbonComponents.DataTable.Shared.row_id/1}
    radio
    selectable
  >
    <:title>DataTable</:title>
    <:description>Radio selection</:description>
    <:col :for={col <- Storybook.CarbonComponents.DataTable.Shared.columns()} :let={row} label={col.label}>
      <%= Map.get(row, col.key) %>
    </:col>
  </.data_table>
  ```

  ```html
  <div id="selection-radio-single-radio-component">
    <cds-table headerCount="0" is-selectable locale="en" radio size="lg" use-zebra-styles id="selection-radio-single-radio" phx-hook="BasicComponentsTable" data-selected-ids="" phx-target="1" phx-update="ignore">
    
      <cds-table-head>
    
        <cds-table-header-row hide-checkbox selection-label="Select all" selection-name="carbon-radio-selection">
    
          <cds-table-header-cell data-col-index="0">
    
            Name
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="1">
    
            Protocol
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="2">
    
            Port
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="3">
    
            Rule
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="4">
    
            Attached groups
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="5">
    
            Status
          
  </cds-table-header-cell>
          
        
  </cds-table-header-row>
      
  </cds-table-head>
      <cds-table-body id="selection-radio-single-radiobody">
    
        
          <cds-table-row selection-label="Select row" selection-name="carbon-radio-selection" selection-value="1" radio id="1" data-row-id="1">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 3

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    3000

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Kevin&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Disabled

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row selection-label="Select row" selection-name="carbon-radio-selection" selection-value="2" radio id="2" data-row-id="2">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 1

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    443

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Maureen&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Starting

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row selection-label="Select row" selection-name="carbon-radio-selection" selection-value="3" radio id="3" data-row-id="3">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 2

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    80

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    DNS delegation

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Andrew&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Active

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row selection-label="Select row" selection-name="carbon-radio-selection" selection-value="4" radio id="4" data-row-id="4">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 6

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    3000

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Marc&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Disabled

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row selection-label="Select row" selection-name="carbon-radio-selection" selection-value="5" radio id="5" data-row-id="5">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 4

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    443

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Mel&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Starting

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row selection-label="Select row" selection-name="carbon-radio-selection" selection-value="6" radio id="6" data-row-id="6">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 5

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    80

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    DNS delegation

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Ronja&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Active

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
      
  </cds-table-body>
    
    <div slot="title">
      
        <cds-table-header-title>
    
          DataTable
        
  </cds-table-header-title>
      
    </div>
    <div slot="description">
      
        <cds-table-header-description>
    
          Radio selection
        
  </cds-table-header-description>
      
    </div>
    
  </cds-table>
  </div>
  ```

  ##### radio_selected

  ```heex
  <.data_table
    id="selection-radio-single-radio-selected"
    rows={[%{id: 1, name: "Load Balancer 3", port: "3000", status: "Disabled", protocol: "HTTP", group: "Kevin's VM Groups", rule: "Round robin"}, %{id: 2, name: "Load Balancer 1", port: "443", status: "Starting", protocol: "HTTP", group: "Maureen's VM Groups", rule: "Round robin"}, %{id: 3, name: "Load Balancer 2", port: "80", status: "Active", protocol: "HTTP", group: "Andrew's VM Groups", rule: "DNS delegation"}, %{id: 4, name: "Load Balancer 6", port: "3000", status: "Disabled", protocol: "HTTP", group: "Marc's VM Groups", rule: "Round robin"}, %{id: 5, name: "Load Balancer 4", port: "443", status: "Starting", protocol: "HTTP", group: "Mel's VM Groups", rule: "Round robin"}, %{id: 6, name: "Load Balancer 5", port: "80", status: "Active", protocol: "HTTP", group: "Ronja's VM Groups", rule: "DNS delegation"}]}
    selection_name="carbon-radio-selection"
    selected_ids={[3]}
    row_id={&Graphene.CarbonComponents.DataTable.Shared.row_id/1}
    radio
    selectable
  >
    <:title>DataTable</:title>
    <:description>Preselected radio</:description>
    <:col :for={col <- Storybook.CarbonComponents.DataTable.Shared.columns()} :let={row} label={col.label}>
      <%= Map.get(row, col.key) %>
    </:col>
  </.data_table>
  ```

  ```html
  <div id="selection-radio-single-radio-selected-component">
    <cds-table headerCount="0" is-selectable locale="en" radio size="lg" use-zebra-styles id="selection-radio-single-radio-selected" phx-hook="BasicComponentsTable" data-selected-ids="3" phx-target="1" phx-update="ignore">
    
      <cds-table-head>
    
        <cds-table-header-row hide-checkbox selection-label="Select all" selection-name="carbon-radio-selection">
    
          <cds-table-header-cell data-col-index="0">
    
            Name
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="1">
    
            Protocol
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="2">
    
            Port
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="3">
    
            Rule
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="4">
    
            Attached groups
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="5">
    
            Status
          
  </cds-table-header-cell>
          
        
  </cds-table-header-row>
      
  </cds-table-head>
      <cds-table-body id="selection-radio-single-radio-selectedbody">
    
        
          <cds-table-row selection-label="Select row" selection-name="carbon-radio-selection" selection-value="1" radio id="1" data-row-id="1">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 3

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    3000

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Kevin&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Disabled

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row selection-label="Select row" selection-name="carbon-radio-selection" selection-value="2" radio id="2" data-row-id="2">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 1

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    443

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Maureen&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Starting

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row selected selection-label="Select row" selection-name="carbon-radio-selection" selection-value="3" radio id="3" data-row-id="3">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 2

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    80

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    DNS delegation

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Andrew&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Active

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row selection-label="Select row" selection-name="carbon-radio-selection" selection-value="4" radio id="4" data-row-id="4">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 6

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    3000

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Marc&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Disabled

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row selection-label="Select row" selection-name="carbon-radio-selection" selection-value="5" radio id="5" data-row-id="5">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 4

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    443

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Mel&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Starting

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row selection-label="Select row" selection-name="carbon-radio-selection" selection-value="6" radio id="6" data-row-id="6">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 5

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    80

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    DNS delegation

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Ronja&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Active

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
      
  </cds-table-body>
    
    <div slot="title">
      
        <cds-table-header-title>
    
          DataTable
        
  </cds-table-header-title>
      
    </div>
    <div slot="description">
      
        <cds-table-header-description>
    
          Preselected radio
        
  </cds-table-header-description>
      
    </div>
    
  </cds-table>
  </div>
  ```


  #### selection_radio_sorting

  ##### radio_sorting

  ```heex
  <.data_table
    id="selection-radio-sorting-single-radio-sorting"
    rows={[%{id: 1, name: "Load Balancer 3", port: "3000", status: "Disabled", protocol: "HTTP", group: "Kevin's VM Groups", rule: "Round robin"}, %{id: 2, name: "Load Balancer 1", port: "443", status: "Starting", protocol: "HTTP", group: "Maureen's VM Groups", rule: "Round robin"}, %{id: 3, name: "Load Balancer 2", port: "80", status: "Active", protocol: "HTTP", group: "Andrew's VM Groups", rule: "DNS delegation"}, %{id: 4, name: "Load Balancer 6", port: "3000", status: "Disabled", protocol: "HTTP", group: "Marc's VM Groups", rule: "Round robin"}, %{id: 5, name: "Load Balancer 4", port: "443", status: "Starting", protocol: "HTTP", group: "Mel's VM Groups", rule: "Round robin"}, %{id: 6, name: "Load Balancer 5", port: "80", status: "Active", protocol: "HTTP", group: "Ronja's VM Groups", rule: "DNS delegation"}]}
    selection_name="carbon-radio-sorting"
    row_id={&Graphene.CarbonComponents.DataTable.Shared.row_id/1}
    radio
    selectable
    sortable
  >
    <:title>DataTable</:title>
    <:description>Radio selection and sorting</:description>
    <:col :for={col <- Storybook.CarbonComponents.DataTable.Shared.columns()} :let={row} label={col.label}>
      <%= Map.get(row, col.key) %>
    </:col>
  </.data_table>
  ```

  ```html
  <div id="selection-radio-sorting-single-radio-sorting-component">
    <cds-table headerCount="0" is-selectable is-sortable locale="en" radio size="lg" use-zebra-styles id="selection-radio-sorting-single-radio-sorting" phx-hook="BasicComponentsTable" data-selected-ids="" phx-target="1" phx-update="ignore">
    
      <cds-table-head>
    
        <cds-table-header-row hide-checkbox selection-label="Select all" selection-name="carbon-radio-sorting">
    
          <cds-table-header-cell is-sortable data-col-index="0">
    
            Name
          
  </cds-table-header-cell><cds-table-header-cell is-sortable data-col-index="1">
    
            Protocol
          
  </cds-table-header-cell><cds-table-header-cell is-sortable data-col-index="2">
    
            Port
          
  </cds-table-header-cell><cds-table-header-cell is-sortable data-col-index="3">
    
            Rule
          
  </cds-table-header-cell><cds-table-header-cell is-sortable data-col-index="4">
    
            Attached groups
          
  </cds-table-header-cell><cds-table-header-cell is-sortable data-col-index="5">
    
            Status
          
  </cds-table-header-cell>
          
        
  </cds-table-header-row>
      
  </cds-table-head>
      <cds-table-body id="selection-radio-sorting-single-radio-sortingbody">
    
        
          <cds-table-row selection-label="Select row" selection-name="carbon-radio-sorting" selection-value="1" radio id="1" data-row-id="1">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 3

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    3000

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Kevin&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Disabled

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row selection-label="Select row" selection-name="carbon-radio-sorting" selection-value="2" radio id="2" data-row-id="2">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 1

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    443

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Maureen&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Starting

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row selection-label="Select row" selection-name="carbon-radio-sorting" selection-value="3" radio id="3" data-row-id="3">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 2

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    80

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    DNS delegation

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Andrew&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Active

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row selection-label="Select row" selection-name="carbon-radio-sorting" selection-value="4" radio id="4" data-row-id="4">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 6

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    3000

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Marc&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Disabled

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row selection-label="Select row" selection-name="carbon-radio-sorting" selection-value="5" radio id="5" data-row-id="5">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 4

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    443

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Mel&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Starting

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row selection-label="Select row" selection-name="carbon-radio-sorting" selection-value="6" radio id="6" data-row-id="6">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 5

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    80

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    DNS delegation

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Ronja&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Active

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
      
  </cds-table-body>
    
    <div slot="title">
      
        <cds-table-header-title>
    
          DataTable
        
  </cds-table-header-title>
      
    </div>
    <div slot="description">
      
        <cds-table-header-description>
    
          Radio selection and sorting
        
  </cds-table-header-description>
      
    </div>
    
  </cds-table>
  </div>
  ```

  ##### compact

  ```heex
  <.data_table
    id="selection-radio-sorting-single-compact"
    size="sm"
    rows={[%{id: 1, name: "Load Balancer 3", port: "3000", status: "Disabled", protocol: "HTTP", group: "Kevin's VM Groups", rule: "Round robin"}, %{id: 2, name: "Load Balancer 1", port: "443", status: "Starting", protocol: "HTTP", group: "Maureen's VM Groups", rule: "Round robin"}, %{id: 3, name: "Load Balancer 2", port: "80", status: "Active", protocol: "HTTP", group: "Andrew's VM Groups", rule: "DNS delegation"}, %{id: 4, name: "Load Balancer 6", port: "3000", status: "Disabled", protocol: "HTTP", group: "Marc's VM Groups", rule: "Round robin"}, %{id: 5, name: "Load Balancer 4", port: "443", status: "Starting", protocol: "HTTP", group: "Mel's VM Groups", rule: "Round robin"}, %{id: 6, name: "Load Balancer 5", port: "80", status: "Active", protocol: "HTTP", group: "Ronja's VM Groups", rule: "DNS delegation"}]}
    selection_name="carbon-radio-sorting"
    row_id={&Graphene.CarbonComponents.DataTable.Shared.row_id/1}
    radio
    selectable
    sortable
  >
    <:title>DataTable</:title>
    <:description>Compact sorting</:description>
    <:col :for={col <- Storybook.CarbonComponents.DataTable.Shared.columns()} :let={row} label={col.label}>
      <%= Map.get(row, col.key) %>
    </:col>
  </.data_table>
  ```

  ```html
  <div id="selection-radio-sorting-single-compact-component">
    <cds-table headerCount="0" is-selectable is-sortable locale="en" radio size="sm" use-zebra-styles id="selection-radio-sorting-single-compact" phx-hook="BasicComponentsTable" data-selected-ids="" phx-target="1" phx-update="ignore">
    
      <cds-table-head>
    
        <cds-table-header-row hide-checkbox selection-label="Select all" selection-name="carbon-radio-sorting">
    
          <cds-table-header-cell is-sortable data-col-index="0">
    
            Name
          
  </cds-table-header-cell><cds-table-header-cell is-sortable data-col-index="1">
    
            Protocol
          
  </cds-table-header-cell><cds-table-header-cell is-sortable data-col-index="2">
    
            Port
          
  </cds-table-header-cell><cds-table-header-cell is-sortable data-col-index="3">
    
            Rule
          
  </cds-table-header-cell><cds-table-header-cell is-sortable data-col-index="4">
    
            Attached groups
          
  </cds-table-header-cell><cds-table-header-cell is-sortable data-col-index="5">
    
            Status
          
  </cds-table-header-cell>
          
        
  </cds-table-header-row>
      
  </cds-table-head>
      <cds-table-body id="selection-radio-sorting-single-compactbody">
    
        
          <cds-table-row selection-label="Select row" selection-name="carbon-radio-sorting" selection-value="1" radio id="1" data-row-id="1">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 3

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    3000

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Kevin&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Disabled

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row selection-label="Select row" selection-name="carbon-radio-sorting" selection-value="2" radio id="2" data-row-id="2">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 1

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    443

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Maureen&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Starting

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row selection-label="Select row" selection-name="carbon-radio-sorting" selection-value="3" radio id="3" data-row-id="3">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 2

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    80

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    DNS delegation

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Andrew&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Active

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row selection-label="Select row" selection-name="carbon-radio-sorting" selection-value="4" radio id="4" data-row-id="4">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 6

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    3000

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Marc&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Disabled

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row selection-label="Select row" selection-name="carbon-radio-sorting" selection-value="5" radio id="5" data-row-id="5">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 4

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    443

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Mel&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Starting

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row selection-label="Select row" selection-name="carbon-radio-sorting" selection-value="6" radio id="6" data-row-id="6">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 5

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    80

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    DNS delegation

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Ronja&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Active

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
      
  </cds-table-body>
    
    <div slot="title">
      
        <cds-table-header-title>
    
          DataTable
        
  </cds-table-header-title>
      
    </div>
    <div slot="description">
      
        <cds-table-header-description>
    
          Compact sorting
        
  </cds-table-header-description>
      
    </div>
    
  </cds-table>
  </div>
  ```


  #### sorting

  ##### sorting

  ```heex
  <.data_table
    id="sorting-single-sorting"
    rows={[%{id: 1, name: "Load Balancer 3", port: "3000", status: "Disabled", protocol: "HTTP", group: "Kevin's VM Groups", rule: "Round robin"}, %{id: 2, name: "Load Balancer 1", port: "443", status: "Starting", protocol: "HTTP", group: "Maureen's VM Groups", rule: "Round robin"}, %{id: 3, name: "Load Balancer 2", port: "80", status: "Active", protocol: "HTTP", group: "Andrew's VM Groups", rule: "DNS delegation"}, %{id: 4, name: "Load Balancer 6", port: "3000", status: "Disabled", protocol: "HTTP", group: "Marc's VM Groups", rule: "Round robin"}, %{id: 5, name: "Load Balancer 4", port: "443", status: "Starting", protocol: "HTTP", group: "Mel's VM Groups", rule: "Round robin"}, %{id: 6, name: "Load Balancer 5", port: "80", status: "Active", protocol: "HTTP", group: "Ronja's VM Groups", rule: "DNS delegation"}]}
    row_id={&Graphene.CarbonComponents.DataTable.Shared.row_id/1}
    sortable
  >
    <:title>DataTable</:title>
    <:description>Sorting enabled</:description>
    <:col :for={col <- Storybook.CarbonComponents.DataTable.Shared.columns()} :let={row} label={col.label}>
      <%= Map.get(row, col.key) %>
    </:col>
  </.data_table>
  ```

  ```html
  <div id="sorting-single-sorting-component">
    <cds-table headerCount="0" is-sortable locale="en" size="lg" use-zebra-styles id="sorting-single-sorting" phx-hook="BasicComponentsTable" data-selected-ids="" phx-target="1" phx-update="ignore">
    
      <cds-table-head>
    
        <cds-table-header-row>
    
          <cds-table-header-cell is-sortable data-col-index="0">
    
            Name
          
  </cds-table-header-cell><cds-table-header-cell is-sortable data-col-index="1">
    
            Protocol
          
  </cds-table-header-cell><cds-table-header-cell is-sortable data-col-index="2">
    
            Port
          
  </cds-table-header-cell><cds-table-header-cell is-sortable data-col-index="3">
    
            Rule
          
  </cds-table-header-cell><cds-table-header-cell is-sortable data-col-index="4">
    
            Attached groups
          
  </cds-table-header-cell><cds-table-header-cell is-sortable data-col-index="5">
    
            Status
          
  </cds-table-header-cell>
          
        
  </cds-table-header-row>
      
  </cds-table-head>
      <cds-table-body id="sorting-single-sortingbody">
    
        
          <cds-table-row id="1" data-row-id="1">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 3

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    3000

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Kevin&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Disabled

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row id="2" data-row-id="2">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 1

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    443

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Maureen&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Starting

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row id="3" data-row-id="3">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 2

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    80

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    DNS delegation

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Andrew&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Active

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row id="4" data-row-id="4">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 6

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    3000

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Marc&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Disabled

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row id="5" data-row-id="5">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 4

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    443

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Mel&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Starting

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row id="6" data-row-id="6">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 5

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    80

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    DNS delegation

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Ronja&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Active

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
      
  </cds-table-body>
    
    <div slot="title">
      
        <cds-table-header-title>
    
          DataTable
        
  </cds-table-header-title>
      
    </div>
    <div slot="description">
      
        <cds-table-header-description>
    
          Sorting enabled
        
  </cds-table-header-description>
      
    </div>
    
  </cds-table>
  </div>
  ```

  ##### compact

  ```heex
  <.data_table
    id="sorting-single-compact"
    size="sm"
    rows={[%{id: 1, name: "Load Balancer 3", port: "3000", status: "Disabled", protocol: "HTTP", group: "Kevin's VM Groups", rule: "Round robin"}, %{id: 2, name: "Load Balancer 1", port: "443", status: "Starting", protocol: "HTTP", group: "Maureen's VM Groups", rule: "Round robin"}, %{id: 3, name: "Load Balancer 2", port: "80", status: "Active", protocol: "HTTP", group: "Andrew's VM Groups", rule: "DNS delegation"}, %{id: 4, name: "Load Balancer 6", port: "3000", status: "Disabled", protocol: "HTTP", group: "Marc's VM Groups", rule: "Round robin"}, %{id: 5, name: "Load Balancer 4", port: "443", status: "Starting", protocol: "HTTP", group: "Mel's VM Groups", rule: "Round robin"}, %{id: 6, name: "Load Balancer 5", port: "80", status: "Active", protocol: "HTTP", group: "Ronja's VM Groups", rule: "DNS delegation"}]}
    row_id={&Graphene.CarbonComponents.DataTable.Shared.row_id/1}
    sortable
  >
    <:title>DataTable</:title>
    <:description>Compact sorting</:description>
    <:col :for={col <- Storybook.CarbonComponents.DataTable.Shared.columns()} :let={row} label={col.label}>
      <%= Map.get(row, col.key) %>
    </:col>
  </.data_table>
  ```

  ```html
  <div id="sorting-single-compact-component">
    <cds-table headerCount="0" is-sortable locale="en" size="sm" use-zebra-styles id="sorting-single-compact" phx-hook="BasicComponentsTable" data-selected-ids="" phx-target="1" phx-update="ignore">
    
      <cds-table-head>
    
        <cds-table-header-row>
    
          <cds-table-header-cell is-sortable data-col-index="0">
    
            Name
          
  </cds-table-header-cell><cds-table-header-cell is-sortable data-col-index="1">
    
            Protocol
          
  </cds-table-header-cell><cds-table-header-cell is-sortable data-col-index="2">
    
            Port
          
  </cds-table-header-cell><cds-table-header-cell is-sortable data-col-index="3">
    
            Rule
          
  </cds-table-header-cell><cds-table-header-cell is-sortable data-col-index="4">
    
            Attached groups
          
  </cds-table-header-cell><cds-table-header-cell is-sortable data-col-index="5">
    
            Status
          
  </cds-table-header-cell>
          
        
  </cds-table-header-row>
      
  </cds-table-head>
      <cds-table-body id="sorting-single-compactbody">
    
        
          <cds-table-row id="1" data-row-id="1">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 3

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    3000

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Kevin&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Disabled

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row id="2" data-row-id="2">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 1

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    443

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Maureen&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Starting

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row id="3" data-row-id="3">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 2

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    80

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    DNS delegation

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Andrew&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Active

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row id="4" data-row-id="4">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 6

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    3000

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Marc&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Disabled

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row id="5" data-row-id="5">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 4

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    443

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Mel&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Starting

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row id="6" data-row-id="6">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 5

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    80

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    DNS delegation

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Ronja&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Active

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
      
  </cds-table-body>
    
    <div slot="title">
      
        <cds-table-header-title>
    
          DataTable
        
  </cds-table-header-title>
      
    </div>
    <div slot="description">
      
        <cds-table-header-description>
    
          Compact sorting
        
  </cds-table-header-description>
      
    </div>
    
  </cds-table>
  </div>
  ```


  #### toolbar

  ##### actions

  ```heex
  <.data_table
    id="toolbar-single-actions"
    rows={[%{id: 1, name: "Load Balancer 3", port: "3000", status: "Disabled", protocol: "HTTP", group: "Kevin's VM Groups", rule: "Round robin"}, %{id: 2, name: "Load Balancer 1", port: "443", status: "Starting", protocol: "HTTP", group: "Maureen's VM Groups", rule: "Round robin"}, %{id: 3, name: "Load Balancer 2", port: "80", status: "Active", protocol: "HTTP", group: "Andrew's VM Groups", rule: "DNS delegation"}, %{id: 4, name: "Load Balancer 6", port: "3000", status: "Disabled", protocol: "HTTP", group: "Marc's VM Groups", rule: "Round robin"}, %{id: 5, name: "Load Balancer 4", port: "443", status: "Starting", protocol: "HTTP", group: "Mel's VM Groups", rule: "Round robin"}, %{id: 6, name: "Load Balancer 5", port: "80", status: "Active", protocol: "HTTP", group: "Ronja's VM Groups", rule: "DNS delegation"}]}
    row_id={&Graphene.CarbonComponents.DataTable.Shared.row_id/1}
  >
    <:title>DataTable</:title>
    <:description>Toolbar actions</:description>
    <:toolbar>
      <Graphene.CarbonComponents.table_toolbar>
        <Graphene.CarbonComponents.table_toolbar_content>
          <Graphene.CarbonComponents.table_toolbar_search placeholder="Filter table" />
          <Graphene.CarbonComponents.overflow_menu toolbar_action>
            <:icon>
              <Storybook.CarbonComponents.DataTable.Shared.overflow_icon />
            </:icon>
            <:tooltip_content>Settings</:tooltip_content>
            <:item>Action 1</:item>
            <:item>Action 2</:item>
            <:item>Action 3</:item>
          </Graphene.CarbonComponents.overflow_menu>
          <Graphene.CarbonComponents.button>Primary button</Graphene.CarbonComponents.button>
        </Graphene.CarbonComponents.table_toolbar_content>
      </Graphene.CarbonComponents.table_toolbar>
    </:toolbar>
    <:col :for={col <- Storybook.CarbonComponents.DataTable.Shared.columns()} :let={row} label={col.label}>
      <%= Map.get(row, col.key) %>
    </:col>
  </.data_table>
  ```

  ```html
  <div id="toolbar-single-actions-component">
    <cds-table headerCount="0" locale="en" size="lg" use-zebra-styles id="toolbar-single-actions" phx-hook="BasicComponentsTable" data-selected-ids="" phx-target="1" phx-update="ignore">
    
      <cds-table-head>
    
        <cds-table-header-row>
    
          <cds-table-header-cell data-col-index="0">
    
            Name
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="1">
    
            Protocol
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="2">
    
            Port
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="3">
    
            Rule
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="4">
    
            Attached groups
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="5">
    
            Status
          
  </cds-table-header-cell>
          
        
  </cds-table-header-row>
      
  </cds-table-head>
      <cds-table-body id="toolbar-single-actionsbody">
    
        
          <cds-table-row id="1" data-row-id="1">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 3

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    3000

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Kevin&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Disabled

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row id="2" data-row-id="2">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 1

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    443

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Maureen&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Starting

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row id="3" data-row-id="3">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 2

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    80

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    DNS delegation

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Andrew&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Active

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row id="4" data-row-id="4">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 6

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    3000

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Marc&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Disabled

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row id="5" data-row-id="5">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 4

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    443

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Mel&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Starting

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row id="6" data-row-id="6">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 5

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    80

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    DNS delegation

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Ronja&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Active

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
      
  </cds-table-body>
    
    <div slot="title">
      
        <cds-table-header-title>
    
          DataTable
        
  </cds-table-header-title>
      
    </div>
    <div slot="description">
      
        <cds-table-header-description>
    
          Toolbar actions
        
  </cds-table-header-description>
      
    </div>
    <div slot="toolbar">
      
    <cds-table-toolbar>
    
      <cds-table-toolbar-content>
    
        <cds-table-toolbar-search autocomplete="off" placeholder="Filter table" size="lg">
    
  </cds-table-toolbar-search>
        <cds-overflow-menu align="top" close-on-activation enter-delay-ms="100" index="1" kind="primary" leave-delay-ms="300" link-role="button" size="md" tab-index="0" toolbar-action tooltip-alignment="" tooltip-position="top" type="button">
    
    <span slot="icon">
      
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" width="auto" fill="currentColor" preserveAspectRatio="xMidYMid meet" aria-hidden>
    
    
    <circle cx="8" cy="16" r="2"/><circle cx="16" cy="16" r="2"/><circle cx="24" cy="16" r="2"/>

  </svg>
          
    </span>
    <span slot="tooltip-content">
      Settings
    </span>
    <cds-overflow-menu-body direction="bottom" size="md">
    
      
        <cds-overflow-menu-item size="md">
    
          Action 1
        
  </cds-overflow-menu-item>
      
        <cds-overflow-menu-item size="md">
    
          Action 2
        
  </cds-overflow-menu-item>
      
        <cds-overflow-menu-item size="md">
    
          Action 3
        
  </cds-overflow-menu-item>
      
    
  </cds-overflow-menu-body>

    
    
  </cds-overflow-menu>
        <cds-button kind="primary" link-role="button" size="lg" tab-index="0" tooltip-alignment="" tooltip-position="top" type="button">
    Primary button
    
  </cds-button>
      
  </cds-table-toolbar-content>
    
  </cds-table-toolbar>

    </div>
  </cds-table>
  </div>
  ```

  ##### compact

  ```heex
  <.data_table
    id="toolbar-single-compact"
    size="sm"
    rows={[%{id: 1, name: "Load Balancer 3", port: "3000", status: "Disabled", protocol: "HTTP", group: "Kevin's VM Groups", rule: "Round robin"}, %{id: 2, name: "Load Balancer 1", port: "443", status: "Starting", protocol: "HTTP", group: "Maureen's VM Groups", rule: "Round robin"}, %{id: 3, name: "Load Balancer 2", port: "80", status: "Active", protocol: "HTTP", group: "Andrew's VM Groups", rule: "DNS delegation"}, %{id: 4, name: "Load Balancer 6", port: "3000", status: "Disabled", protocol: "HTTP", group: "Marc's VM Groups", rule: "Round robin"}, %{id: 5, name: "Load Balancer 4", port: "443", status: "Starting", protocol: "HTTP", group: "Mel's VM Groups", rule: "Round robin"}, %{id: 6, name: "Load Balancer 5", port: "80", status: "Active", protocol: "HTTP", group: "Ronja's VM Groups", rule: "DNS delegation"}]}
    row_id={&Graphene.CarbonComponents.DataTable.Shared.row_id/1}
  >
    <:title>DataTable</:title>
    <:description>Compact toolbar</:description>
    <:toolbar>
      <Graphene.CarbonComponents.table_toolbar>
        <Graphene.CarbonComponents.table_toolbar_content>
          <Graphene.CarbonComponents.table_toolbar_search placeholder="Filter table" />
          <Graphene.CarbonComponents.overflow_menu toolbar_action>
            <:icon>
              <Storybook.CarbonComponents.DataTable.Shared.overflow_icon />
            </:icon>
            <:tooltip_content>Settings</:tooltip_content>
            <:item>Action 1</:item>
            <:item>Action 2</:item>
          </Graphene.CarbonComponents.overflow_menu>
        </Graphene.CarbonComponents.table_toolbar_content>
      </Graphene.CarbonComponents.table_toolbar>
    </:toolbar>
    <:col :for={col <- Storybook.CarbonComponents.DataTable.Shared.columns()} :let={row} label={col.label}>
      <%= Map.get(row, col.key) %>
    </:col>
  </.data_table>
  ```

  ```html
  <div id="toolbar-single-compact-component">
    <cds-table headerCount="0" locale="en" size="sm" use-zebra-styles id="toolbar-single-compact" phx-hook="BasicComponentsTable" data-selected-ids="" phx-target="1" phx-update="ignore">
    
      <cds-table-head>
    
        <cds-table-header-row>
    
          <cds-table-header-cell data-col-index="0">
    
            Name
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="1">
    
            Protocol
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="2">
    
            Port
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="3">
    
            Rule
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="4">
    
            Attached groups
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="5">
    
            Status
          
  </cds-table-header-cell>
          
        
  </cds-table-header-row>
      
  </cds-table-head>
      <cds-table-body id="toolbar-single-compactbody">
    
        
          <cds-table-row id="1" data-row-id="1">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 3

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    3000

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Kevin&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Disabled

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row id="2" data-row-id="2">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 1

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    443

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Maureen&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Starting

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row id="3" data-row-id="3">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 2

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    80

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    DNS delegation

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Andrew&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Active

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row id="4" data-row-id="4">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 6

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    3000

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Marc&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Disabled

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row id="5" data-row-id="5">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 4

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    443

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Mel&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Starting

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row id="6" data-row-id="6">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 5

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    80

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    DNS delegation

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Ronja&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Active

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
      
  </cds-table-body>
    
    <div slot="title">
      
        <cds-table-header-title>
    
          DataTable
        
  </cds-table-header-title>
      
    </div>
    <div slot="description">
      
        <cds-table-header-description>
    
          Compact toolbar
        
  </cds-table-header-description>
      
    </div>
    <div slot="toolbar">
      
    <cds-table-toolbar>
    
      <cds-table-toolbar-content>
    
        <cds-table-toolbar-search autocomplete="off" placeholder="Filter table" size="lg">
    
  </cds-table-toolbar-search>
        <cds-overflow-menu align="top" close-on-activation enter-delay-ms="100" index="1" kind="primary" leave-delay-ms="300" link-role="button" size="md" tab-index="0" toolbar-action tooltip-alignment="" tooltip-position="top" type="button">
    
    <span slot="icon">
      
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" width="auto" fill="currentColor" preserveAspectRatio="xMidYMid meet" aria-hidden>
    
    
    <circle cx="8" cy="16" r="2"/><circle cx="16" cy="16" r="2"/><circle cx="24" cy="16" r="2"/>

  </svg>
          
    </span>
    <span slot="tooltip-content">
      Settings
    </span>
    <cds-overflow-menu-body direction="bottom" size="md">
    
      
        <cds-overflow-menu-item size="md">
    
          Action 1
        
  </cds-overflow-menu-item>
      
        <cds-overflow-menu-item size="md">
    
          Action 2
        
  </cds-overflow-menu-item>
      
    
  </cds-overflow-menu-body>

    
    
  </cds-overflow-menu>
      
  </cds-table-toolbar-content>
    
  </cds-table-toolbar>

    </div>
  </cds-table>
  </div>
  ```


  #### toolbar_persistent

  ##### persistent

  ```heex
  <.data_table
    id="toolbar-persistent-single-persistent"
    rows={[%{id: 1, name: "Load Balancer 3", port: "3000", status: "Disabled", protocol: "HTTP", group: "Kevin's VM Groups", rule: "Round robin"}, %{id: 2, name: "Load Balancer 1", port: "443", status: "Starting", protocol: "HTTP", group: "Maureen's VM Groups", rule: "Round robin"}, %{id: 3, name: "Load Balancer 2", port: "80", status: "Active", protocol: "HTTP", group: "Andrew's VM Groups", rule: "DNS delegation"}, %{id: 4, name: "Load Balancer 6", port: "3000", status: "Disabled", protocol: "HTTP", group: "Marc's VM Groups", rule: "Round robin"}, %{id: 5, name: "Load Balancer 4", port: "443", status: "Starting", protocol: "HTTP", group: "Mel's VM Groups", rule: "Round robin"}, %{id: 6, name: "Load Balancer 5", port: "80", status: "Active", protocol: "HTTP", group: "Ronja's VM Groups", rule: "DNS delegation"}]}
    row_id={&Graphene.CarbonComponents.DataTable.Shared.row_id/1}
  >
    <:title>DataTable</:title>
    <:description>With persistent toolbar</:description>
    <:toolbar>
      <Graphene.CarbonComponents.table_toolbar>
        <Graphene.CarbonComponents.table_toolbar_content>
          <Graphene.CarbonComponents.table_toolbar_search persistent placeholder="Filter table" />
          <Graphene.CarbonComponents.overflow_menu toolbar_action>
            <:icon>
              <Storybook.CarbonComponents.DataTable.Shared.overflow_icon />
            </:icon>
            <:tooltip_content>Settings</:tooltip_content>
            <:item>Action 1</:item>
            <:item>Action 2</:item>
            <:item>Action 3</:item>
          </Graphene.CarbonComponents.overflow_menu>
          <Graphene.CarbonComponents.button>Primary button</Graphene.CarbonComponents.button>
        </Graphene.CarbonComponents.table_toolbar_content>
      </Graphene.CarbonComponents.table_toolbar>
    </:toolbar>
    <:col :for={col <- Storybook.CarbonComponents.DataTable.Shared.columns()} :let={row} label={col.label}>
      <%= Map.get(row, col.key) %>
    </:col>
  </.data_table>
  ```

  ```html
  <div id="toolbar-persistent-single-persistent-component">
    <cds-table headerCount="0" locale="en" size="lg" use-zebra-styles id="toolbar-persistent-single-persistent" phx-hook="BasicComponentsTable" data-selected-ids="" phx-target="1" phx-update="ignore">
    
      <cds-table-head>
    
        <cds-table-header-row>
    
          <cds-table-header-cell data-col-index="0">
    
            Name
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="1">
    
            Protocol
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="2">
    
            Port
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="3">
    
            Rule
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="4">
    
            Attached groups
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="5">
    
            Status
          
  </cds-table-header-cell>
          
        
  </cds-table-header-row>
      
  </cds-table-head>
      <cds-table-body id="toolbar-persistent-single-persistentbody">
    
        
          <cds-table-row id="1" data-row-id="1">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 3

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    3000

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Kevin&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Disabled

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row id="2" data-row-id="2">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 1

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    443

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Maureen&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Starting

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row id="3" data-row-id="3">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 2

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    80

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    DNS delegation

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Andrew&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Active

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row id="4" data-row-id="4">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 6

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    3000

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Marc&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Disabled

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row id="5" data-row-id="5">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 4

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    443

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Mel&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Starting

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row id="6" data-row-id="6">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 5

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    80

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    DNS delegation

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Ronja&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Active

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
      
  </cds-table-body>
    
    <div slot="title">
      
        <cds-table-header-title>
    
          DataTable
        
  </cds-table-header-title>
      
    </div>
    <div slot="description">
      
        <cds-table-header-description>
    
          With persistent toolbar
        
  </cds-table-header-description>
      
    </div>
    <div slot="toolbar">
      
    <cds-table-toolbar>
    
      <cds-table-toolbar-content>
    
        <cds-table-toolbar-search autocomplete="off" persistent placeholder="Filter table" size="lg">
    
  </cds-table-toolbar-search>
        <cds-overflow-menu align="top" close-on-activation enter-delay-ms="100" index="1" kind="primary" leave-delay-ms="300" link-role="button" size="md" tab-index="0" toolbar-action tooltip-alignment="" tooltip-position="top" type="button">
    
    <span slot="icon">
      
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" width="auto" fill="currentColor" preserveAspectRatio="xMidYMid meet" aria-hidden>
    
    
    <circle cx="8" cy="16" r="2"/><circle cx="16" cy="16" r="2"/><circle cx="24" cy="16" r="2"/>

  </svg>
          
    </span>
    <span slot="tooltip-content">
      Settings
    </span>
    <cds-overflow-menu-body direction="bottom" size="md">
    
      
        <cds-overflow-menu-item size="md">
    
          Action 1
        
  </cds-overflow-menu-item>
      
        <cds-overflow-menu-item size="md">
    
          Action 2
        
  </cds-overflow-menu-item>
      
        <cds-overflow-menu-item size="md">
    
          Action 3
        
  </cds-overflow-menu-item>
      
    
  </cds-overflow-menu-body>

    
    
  </cds-overflow-menu>
        <cds-button kind="primary" link-role="button" size="lg" tab-index="0" tooltip-alignment="" tooltip-position="top" type="button">
    Primary button
    
  </cds-button>
      
  </cds-table-toolbar-content>
    
  </cds-table-toolbar>

    </div>
  </cds-table>
  </div>
  ```

  ##### compact

  ```heex
  <.data_table
    id="toolbar-persistent-single-compact"
    size="sm"
    rows={[%{id: 1, name: "Load Balancer 3", port: "3000", status: "Disabled", protocol: "HTTP", group: "Kevin's VM Groups", rule: "Round robin"}, %{id: 2, name: "Load Balancer 1", port: "443", status: "Starting", protocol: "HTTP", group: "Maureen's VM Groups", rule: "Round robin"}, %{id: 3, name: "Load Balancer 2", port: "80", status: "Active", protocol: "HTTP", group: "Andrew's VM Groups", rule: "DNS delegation"}, %{id: 4, name: "Load Balancer 6", port: "3000", status: "Disabled", protocol: "HTTP", group: "Marc's VM Groups", rule: "Round robin"}, %{id: 5, name: "Load Balancer 4", port: "443", status: "Starting", protocol: "HTTP", group: "Mel's VM Groups", rule: "Round robin"}, %{id: 6, name: "Load Balancer 5", port: "80", status: "Active", protocol: "HTTP", group: "Ronja's VM Groups", rule: "DNS delegation"}]}
    row_id={&Graphene.CarbonComponents.DataTable.Shared.row_id/1}
  >
    <:title>DataTable</:title>
    <:description>Compact persistent toolbar</:description>
    <:toolbar>
      <Graphene.CarbonComponents.table_toolbar>
        <Graphene.CarbonComponents.table_toolbar_content>
          <Graphene.CarbonComponents.table_toolbar_search persistent placeholder="Filter table" />
          <Graphene.CarbonComponents.overflow_menu toolbar_action>
            <:icon>
              <Storybook.CarbonComponents.DataTable.Shared.overflow_icon />
            </:icon>
            <:tooltip_content>Settings</:tooltip_content>
            <:item>Action 1</:item>
            <:item>Action 2</:item>
          </Graphene.CarbonComponents.overflow_menu>
        </Graphene.CarbonComponents.table_toolbar_content>
      </Graphene.CarbonComponents.table_toolbar>
    </:toolbar>
    <:col :for={col <- Storybook.CarbonComponents.DataTable.Shared.columns()} :let={row} label={col.label}>
      <%= Map.get(row, col.key) %>
    </:col>
  </.data_table>
  ```

  ```html
  <div id="toolbar-persistent-single-compact-component">
    <cds-table headerCount="0" locale="en" size="sm" use-zebra-styles id="toolbar-persistent-single-compact" phx-hook="BasicComponentsTable" data-selected-ids="" phx-target="1" phx-update="ignore">
    
      <cds-table-head>
    
        <cds-table-header-row>
    
          <cds-table-header-cell data-col-index="0">
    
            Name
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="1">
    
            Protocol
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="2">
    
            Port
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="3">
    
            Rule
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="4">
    
            Attached groups
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="5">
    
            Status
          
  </cds-table-header-cell>
          
        
  </cds-table-header-row>
      
  </cds-table-head>
      <cds-table-body id="toolbar-persistent-single-compactbody">
    
        
          <cds-table-row id="1" data-row-id="1">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 3

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    3000

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Kevin&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Disabled

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row id="2" data-row-id="2">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 1

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    443

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Maureen&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Starting

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row id="3" data-row-id="3">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 2

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    80

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    DNS delegation

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Andrew&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Active

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row id="4" data-row-id="4">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 6

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    3000

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Marc&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Disabled

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row id="5" data-row-id="5">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 4

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    443

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Mel&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Starting

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row id="6" data-row-id="6">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 5

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    80

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    DNS delegation

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Ronja&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Active

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
      
  </cds-table-body>
    
    <div slot="title">
      
        <cds-table-header-title>
    
          DataTable
        
  </cds-table-header-title>
      
    </div>
    <div slot="description">
      
        <cds-table-header-description>
    
          Compact persistent toolbar
        
  </cds-table-header-description>
      
    </div>
    <div slot="toolbar">
      
    <cds-table-toolbar>
    
      <cds-table-toolbar-content>
    
        <cds-table-toolbar-search autocomplete="off" persistent placeholder="Filter table" size="lg">
    
  </cds-table-toolbar-search>
        <cds-overflow-menu align="top" close-on-activation enter-delay-ms="100" index="1" kind="primary" leave-delay-ms="300" link-role="button" size="md" tab-index="0" toolbar-action tooltip-alignment="" tooltip-position="top" type="button">
    
    <span slot="icon">
      
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" width="auto" fill="currentColor" preserveAspectRatio="xMidYMid meet" aria-hidden>
    
    
    <circle cx="8" cy="16" r="2"/><circle cx="16" cy="16" r="2"/><circle cx="24" cy="16" r="2"/>

  </svg>
          
    </span>
    <span slot="tooltip-content">
      Settings
    </span>
    <cds-overflow-menu-body direction="bottom" size="md">
    
      
        <cds-overflow-menu-item size="md">
    
          Action 1
        
  </cds-overflow-menu-item>
      
        <cds-overflow-menu-item size="md">
    
          Action 2
        
  </cds-overflow-menu-item>
      
    
  </cds-overflow-menu-body>

    
    
  </cds-overflow-menu>
      
  </cds-table-toolbar-content>
    
  </cds-table-toolbar>

    </div>
  </cds-table>
  </div>
  ```


  #### toolbar_persistent_small

  ##### small

  ```heex
  <.data_table
    id="toolbar-persistent-small-single-small"
    size="sm"
    rows={[%{id: 1, name: "Load Balancer 3", port: "3000", status: "Disabled", protocol: "HTTP", group: "Kevin's VM Groups", rule: "Round robin"}, %{id: 2, name: "Load Balancer 1", port: "443", status: "Starting", protocol: "HTTP", group: "Maureen's VM Groups", rule: "Round robin"}, %{id: 3, name: "Load Balancer 2", port: "80", status: "Active", protocol: "HTTP", group: "Andrew's VM Groups", rule: "DNS delegation"}, %{id: 4, name: "Load Balancer 6", port: "3000", status: "Disabled", protocol: "HTTP", group: "Marc's VM Groups", rule: "Round robin"}, %{id: 5, name: "Load Balancer 4", port: "443", status: "Starting", protocol: "HTTP", group: "Mel's VM Groups", rule: "Round robin"}, %{id: 6, name: "Load Balancer 5", port: "80", status: "Active", protocol: "HTTP", group: "Ronja's VM Groups", rule: "DNS delegation"}]}
    row_id={&Graphene.CarbonComponents.DataTable.Shared.row_id/1}
  >
    <:title>DataTable</:title>
    <:description>Small persistent toolbar</:description>
    <:toolbar>
      <Graphene.CarbonComponents.table_toolbar>
        <Graphene.CarbonComponents.table_toolbar_content>
          <Graphene.CarbonComponents.table_toolbar_search persistent placeholder="Filter table" />
          <Graphene.CarbonComponents.overflow_menu toolbar_action>
            <:icon>
              <Storybook.CarbonComponents.DataTable.Shared.overflow_icon />
            </:icon>
            <:tooltip_content>Settings</:tooltip_content>
            <:item>Action 1</:item>
            <:item>Action 2</:item>
            <:item>Action 3</:item>
          </Graphene.CarbonComponents.overflow_menu>
          <Graphene.CarbonComponents.button>Primary button</Graphene.CarbonComponents.button>
        </Graphene.CarbonComponents.table_toolbar_content>
      </Graphene.CarbonComponents.table_toolbar>
    </:toolbar>
    <:col :for={col <- Storybook.CarbonComponents.DataTable.Shared.columns()} :let={row} label={col.label}>
      <%= Map.get(row, col.key) %>
    </:col>
  </.data_table>
  ```

  ```html
  <div id="toolbar-persistent-small-single-small-component">
    <cds-table headerCount="0" locale="en" size="sm" use-zebra-styles id="toolbar-persistent-small-single-small" phx-hook="BasicComponentsTable" data-selected-ids="" phx-target="1" phx-update="ignore">
    
      <cds-table-head>
    
        <cds-table-header-row>
    
          <cds-table-header-cell data-col-index="0">
    
            Name
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="1">
    
            Protocol
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="2">
    
            Port
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="3">
    
            Rule
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="4">
    
            Attached groups
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="5">
    
            Status
          
  </cds-table-header-cell>
          
        
  </cds-table-header-row>
      
  </cds-table-head>
      <cds-table-body id="toolbar-persistent-small-single-smallbody">
    
        
          <cds-table-row id="1" data-row-id="1">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 3

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    3000

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Kevin&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Disabled

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row id="2" data-row-id="2">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 1

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    443

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Maureen&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Starting

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row id="3" data-row-id="3">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 2

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    80

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    DNS delegation

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Andrew&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Active

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row id="4" data-row-id="4">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 6

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    3000

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Marc&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Disabled

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row id="5" data-row-id="5">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 4

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    443

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Mel&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Starting

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row id="6" data-row-id="6">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 5

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    80

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    DNS delegation

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Ronja&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Active

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
      
  </cds-table-body>
    
    <div slot="title">
      
        <cds-table-header-title>
    
          DataTable
        
  </cds-table-header-title>
      
    </div>
    <div slot="description">
      
        <cds-table-header-description>
    
          Small persistent toolbar
        
  </cds-table-header-description>
      
    </div>
    <div slot="toolbar">
      
    <cds-table-toolbar>
    
      <cds-table-toolbar-content>
    
        <cds-table-toolbar-search autocomplete="off" persistent placeholder="Filter table" size="lg">
    
  </cds-table-toolbar-search>
        <cds-overflow-menu align="top" close-on-activation enter-delay-ms="100" index="1" kind="primary" leave-delay-ms="300" link-role="button" size="md" tab-index="0" toolbar-action tooltip-alignment="" tooltip-position="top" type="button">
    
    <span slot="icon">
      
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" width="auto" fill="currentColor" preserveAspectRatio="xMidYMid meet" aria-hidden>
    
    
    <circle cx="8" cy="16" r="2"/><circle cx="16" cy="16" r="2"/><circle cx="24" cy="16" r="2"/>

  </svg>
          
    </span>
    <span slot="tooltip-content">
      Settings
    </span>
    <cds-overflow-menu-body direction="bottom" size="md">
    
      
        <cds-overflow-menu-item size="md">
    
          Action 1
        
  </cds-overflow-menu-item>
      
        <cds-overflow-menu-item size="md">
    
          Action 2
        
  </cds-overflow-menu-item>
      
        <cds-overflow-menu-item size="md">
    
          Action 3
        
  </cds-overflow-menu-item>
      
    
  </cds-overflow-menu-body>

    
    
  </cds-overflow-menu>
        <cds-button kind="primary" link-role="button" size="lg" tab-index="0" tooltip-alignment="" tooltip-position="top" type="button">
    Primary button
    
  </cds-button>
      
  </cds-table-toolbar-content>
    
  </cds-table-toolbar>

    </div>
  </cds-table>
  </div>
  ```

  ##### extra_small

  ```heex
  <.data_table
    id="toolbar-persistent-small-single-extra-small"
    size="xs"
    rows={[%{id: 1, name: "Load Balancer 3", port: "3000", status: "Disabled", protocol: "HTTP", group: "Kevin's VM Groups", rule: "Round robin"}, %{id: 2, name: "Load Balancer 1", port: "443", status: "Starting", protocol: "HTTP", group: "Maureen's VM Groups", rule: "Round robin"}, %{id: 3, name: "Load Balancer 2", port: "80", status: "Active", protocol: "HTTP", group: "Andrew's VM Groups", rule: "DNS delegation"}, %{id: 4, name: "Load Balancer 6", port: "3000", status: "Disabled", protocol: "HTTP", group: "Marc's VM Groups", rule: "Round robin"}, %{id: 5, name: "Load Balancer 4", port: "443", status: "Starting", protocol: "HTTP", group: "Mel's VM Groups", rule: "Round robin"}, %{id: 6, name: "Load Balancer 5", port: "80", status: "Active", protocol: "HTTP", group: "Ronja's VM Groups", rule: "DNS delegation"}]}
    row_id={&Graphene.CarbonComponents.DataTable.Shared.row_id/1}
  >
    <:title>DataTable</:title>
    <:description>Extra small</:description>
    <:toolbar>
      <Graphene.CarbonComponents.table_toolbar>
        <Graphene.CarbonComponents.table_toolbar_content>
          <Graphene.CarbonComponents.table_toolbar_search persistent placeholder="Filter table" />
          <Graphene.CarbonComponents.overflow_menu toolbar_action>
            <:icon>
              <Storybook.CarbonComponents.DataTable.Shared.overflow_icon />
            </:icon>
            <:tooltip_content>Settings</:tooltip_content>
            <:item>Action 1</:item>
            <:item>Action 2</:item>
          </Graphene.CarbonComponents.overflow_menu>
        </Graphene.CarbonComponents.table_toolbar_content>
      </Graphene.CarbonComponents.table_toolbar>
    </:toolbar>
    <:col :for={col <- Storybook.CarbonComponents.DataTable.Shared.columns()} :let={row} label={col.label}>
      <%= Map.get(row, col.key) %>
    </:col>
  </.data_table>
  ```

  ```html
  <div id="toolbar-persistent-small-single-extra-small-component">
    <cds-table headerCount="0" locale="en" size="xs" use-zebra-styles id="toolbar-persistent-small-single-extra-small" phx-hook="BasicComponentsTable" data-selected-ids="" phx-target="1" phx-update="ignore">
    
      <cds-table-head>
    
        <cds-table-header-row>
    
          <cds-table-header-cell data-col-index="0">
    
            Name
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="1">
    
            Protocol
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="2">
    
            Port
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="3">
    
            Rule
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="4">
    
            Attached groups
          
  </cds-table-header-cell><cds-table-header-cell data-col-index="5">
    
            Status
          
  </cds-table-header-cell>
          
        
  </cds-table-header-row>
      
  </cds-table-head>
      <cds-table-body id="toolbar-persistent-small-single-extra-smallbody">
    
        
          <cds-table-row id="1" data-row-id="1">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 3

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    3000

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Kevin&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Disabled

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row id="2" data-row-id="2">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 1

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    443

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Maureen&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Starting

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row id="3" data-row-id="3">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 2

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    80

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    DNS delegation

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Andrew&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Active

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row id="4" data-row-id="4">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 6

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    3000

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Marc&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Disabled

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row id="5" data-row-id="5">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 4

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    443

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Round robin

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Mel&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Starting

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
          <cds-table-row id="6" data-row-id="6">
    
            
            <cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Load Balancer 5

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    HTTP

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    80

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    DNS delegation

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Ronja&#39;s VM Groups

              
  </cds-table-cell-content>
            
  </cds-table-cell><cds-table-cell>
    
              <cds-table-cell-content>
    
                
    Active

              
  </cds-table-cell-content>
            
  </cds-table-cell>
            
          
  </cds-table-row>
          
        
      
  </cds-table-body>
    
    <div slot="title">
      
        <cds-table-header-title>
    
          DataTable
        
  </cds-table-header-title>
      
    </div>
    <div slot="description">
      
        <cds-table-header-description>
    
          Extra small
        
  </cds-table-header-description>
      
    </div>
    <div slot="toolbar">
      
    <cds-table-toolbar>
    
      <cds-table-toolbar-content>
    
        <cds-table-toolbar-search autocomplete="off" persistent placeholder="Filter table" size="lg">
    
  </cds-table-toolbar-search>
        <cds-overflow-menu align="top" close-on-activation enter-delay-ms="100" index="1" kind="primary" leave-delay-ms="300" link-role="button" size="md" tab-index="0" toolbar-action tooltip-alignment="" tooltip-position="top" type="button">
    
    <span slot="icon">
      
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" width="auto" fill="currentColor" preserveAspectRatio="xMidYMid meet" aria-hidden>
    
    
    <circle cx="8" cy="16" r="2"/><circle cx="16" cy="16" r="2"/><circle cx="24" cy="16" r="2"/>

  </svg>
          
    </span>
    <span slot="tooltip-content">
      Settings
    </span>
    <cds-overflow-menu-body direction="bottom" size="md">
    
      
        <cds-overflow-menu-item size="md">
    
          Action 1
        
  </cds-overflow-menu-item>
      
        <cds-overflow-menu-item size="md">
    
          Action 2
        
  </cds-overflow-menu-item>
      
    
  </cds-overflow-menu-body>

    
    
  </cds-overflow-menu>
      
  </cds-table-toolbar-content>
    
  </cds-table-toolbar>

    </div>
  </cds-table>
  </div>
  ```


  ### `date_picker`

  #### basic

  ##### single

  ```heex
  <.date_picker name="date-picker-single" date_format="d/m/Y">
    <:input label="Start date" placeholder="dd/mm/yyyy" />
  </.date_picker>
  ```

  ```html
  <input type="hidden" id="date-picker-single-input" name="date-picker-single" value="">
  <cds-date-picker allow-input close-on-select date-format="d/m/Y" name="date-picker-single" id="basic-single-single" data-form-detail="checked" data-form-event="cds-date-picker-changed" data-form-input="date-picker-single-input" data-form-mode="value" phx-hook="Graphene.FormComponents.GrapheneFormBridge">
    
    
      <cds-date-picker-input color-scheme="" label-text="Start date" placeholder="dd/mm/yyyy" size="md">
    
  </cds-date-picker-input>
    

  </cds-date-picker>
  ```

  ##### range

  ```heex
  <.date_picker name="date-picker-range" value="2024-01-10/2024-01-14" date_format="d/m/Y">
    <:input label="Start" placeholder="dd/mm/yyyy" />
    <:input label="End" placeholder="dd/mm/yyyy" />
  </.date_picker>
  ```

  ```html
  <input type="hidden" id="date-picker-range-input" name="date-picker-range" value="2024-01-10/2024-01-14">
  <cds-date-picker allow-input close-on-select date-format="d/m/Y" name="date-picker-range" value="2024-01-10/2024-01-14" id="basic-single-range" data-form-detail="checked" data-form-event="cds-date-picker-changed" data-form-input="date-picker-range-input" data-form-mode="value" phx-hook="Graphene.FormComponents.GrapheneFormBridge">
    
    
      <cds-date-picker-input color-scheme="" label-text="Start" placeholder="dd/mm/yyyy" size="md">
    
  </cds-date-picker-input>
    
      <cds-date-picker-input color-scheme="" label-text="End" placeholder="dd/mm/yyyy" size="md">
    
  </cds-date-picker-input>
    

  </cds-date-picker>
  ```

  ##### disabled

  ```heex
  <.date_picker disabled name="date-picker-disabled" date_format="d/m/Y">
    <:input label="Disabled" placeholder="dd/mm/yyyy" disabled={true} />
  </.date_picker>
  ```

  ```html
  <input type="hidden" id="date-picker-disabled-input" name="date-picker-disabled" value="">
  <cds-date-picker allow-input close-on-select date-format="d/m/Y" disabled name="date-picker-disabled" id="basic-single-disabled" data-form-detail="checked" data-form-event="cds-date-picker-changed" data-form-input="date-picker-disabled-input" data-form-mode="value" phx-hook="Graphene.FormComponents.GrapheneFormBridge">
    
    
      <cds-date-picker-input color-scheme="" disabled label-text="Disabled" placeholder="dd/mm/yyyy" size="md">
    
  </cds-date-picker-input>
    

  </cds-date-picker>
  ```


  ### `definition_tooltip`

  #### tooltip/definition

  ##### default

  ```heex
  <.definition_tooltip >
    Tooltip
  </.definition_tooltip>
  ```

  ```html
  <cds-definition-tooltip align="bottom" id="definition-single-default">
    
    Tooltip

    
  </cds-definition-tooltip>
  ```

  ##### short

  ```heex
  <.definition_tooltip >
    AI
  </.definition_tooltip>
  ```

  ```html
  <cds-definition-tooltip align="bottom" id="definition-single-short">
    
    AI

    
  </cds-definition-tooltip>
  ```

  ##### long

  ```heex
  <.definition_tooltip >
    Confidence score
  </.definition_tooltip>
  ```

  ```html
  <cds-definition-tooltip align="bottom" id="definition-single-long">
    
    Confidence score

    
  </cds-definition-tooltip>
  ```


  ### `dropdown`

  #### basic

  ##### default

  ```heex
  <.dropdown name="dropdown-default" value="all">
    <:title_text>Dropdown</:title_text>
    <:item value="all">All</:item>
    <:item value="cloud">Cloud</:item>
    <:item value="edge">Edge</:item>
  </.dropdown>
  ```

  ```html
  <input type="hidden" id="dropdown-default-input" name="dropdown-default" value="all">
  <cds-dropdown direction="bottom" name="dropdown-default" required-validity-message="Please fill out this field." size="md" type="" value="all" id="basic-single-default" data-form-detail="checked" data-form-event="cds-dropdown-selected" data-form-input="dropdown-default-input" data-form-mode="value" phx-hook="Graphene.FormComponents.GrapheneFormBridge">
    
    
    <div slot="title-text">
      Dropdown
    </div>
    
      <cds-dropdown-item size="md" value="all">
    
        All
      
  </cds-dropdown-item>
    
      <cds-dropdown-item size="md" value="cloud">
    
        Cloud
      
  </cds-dropdown-item>
    
      <cds-dropdown-item size="md" value="edge">
    
        Edge
      
  </cds-dropdown-item>
    

    
    

    
  </cds-dropdown>
  ```

  ##### inline

  ```heex
  <.dropdown name="dropdown-inline" type="inline" value="alpha">
    <:title_text>Inline</:title_text>
    <:item value="alpha">Alpha</:item>
    <:item value="beta">Beta</:item>
    <:item value="gamma">Gamma</:item>
  </.dropdown>
  ```

  ```html
  <input type="hidden" id="dropdown-inline-input" name="dropdown-inline" value="alpha">
  <cds-dropdown direction="bottom" name="dropdown-inline" required-validity-message="Please fill out this field." size="md" type="inline" value="alpha" id="basic-single-inline" data-form-detail="checked" data-form-event="cds-dropdown-selected" data-form-input="dropdown-inline-input" data-form-mode="value" phx-hook="Graphene.FormComponents.GrapheneFormBridge">
    
    
    <div slot="title-text">
      Inline
    </div>
    
      <cds-dropdown-item size="md" value="alpha">
    
        Alpha
      
  </cds-dropdown-item>
    
      <cds-dropdown-item size="md" value="beta">
    
        Beta
      
  </cds-dropdown-item>
    
      <cds-dropdown-item size="md" value="gamma">
    
        Gamma
      
  </cds-dropdown-item>
    

    
    

    
  </cds-dropdown>
  ```

  ##### group: sizes

  ```heex
  <.dropdown name="dropdown-sm" size="sm" value="one">
    <:title_text>Size sm</:title_text>
    <:item value="one">One</:item>
    <:item value="two">Two</:item>
  </.dropdown>
  <.dropdown name="dropdown-md" size="md" value="one">
    <:title_text>Size md</:title_text>
    <:item value="one">One</:item>
    <:item value="two">Two</:item>
  </.dropdown>
  <.dropdown name="dropdown-lg" size="lg" value="one">
    <:title_text>Size lg</:title_text>
    <:item value="one">One</:item>
    <:item value="two">Two</:item>
  </.dropdown>
  ```

  ```html
  <input type="hidden" id="dropdown-sm-input" name="dropdown-sm" value="one">
  <cds-dropdown direction="bottom" name="dropdown-sm" required-validity-message="Please fill out this field." size="sm" type="" value="one" id="basic-sizes-sm" data-form-detail="checked" data-form-event="cds-dropdown-selected" data-form-input="dropdown-sm-input" data-form-mode="value" phx-hook="Graphene.FormComponents.GrapheneFormBridge">
    
    
    <div slot="title-text">
      Size sm
    </div>
    
      <cds-dropdown-item size="md" value="one">
    
        One
      
  </cds-dropdown-item>
    
      <cds-dropdown-item size="md" value="two">
    
        Two
      
  </cds-dropdown-item>
    

    
    

    
  </cds-dropdown>

  <input type="hidden" id="dropdown-md-input" name="dropdown-md" value="one">
  <cds-dropdown direction="bottom" name="dropdown-md" required-validity-message="Please fill out this field." size="md" type="" value="one" id="basic-sizes-md" data-form-detail="checked" data-form-event="cds-dropdown-selected" data-form-input="dropdown-md-input" data-form-mode="value" phx-hook="Graphene.FormComponents.GrapheneFormBridge">
    
    
    <div slot="title-text">
      Size md
    </div>
    
      <cds-dropdown-item size="md" value="one">
    
        One
      
  </cds-dropdown-item>
    
      <cds-dropdown-item size="md" value="two">
    
        Two
      
  </cds-dropdown-item>
    

    
    

    
  </cds-dropdown>

  <input type="hidden" id="dropdown-lg-input" name="dropdown-lg" value="one">
  <cds-dropdown direction="bottom" name="dropdown-lg" required-validity-message="Please fill out this field." size="lg" type="" value="one" id="basic-sizes-lg" data-form-detail="checked" data-form-event="cds-dropdown-selected" data-form-input="dropdown-lg-input" data-form-mode="value" phx-hook="Graphene.FormComponents.GrapheneFormBridge">
    
    
    <div slot="title-text">
      Size lg
    </div>
    
      <cds-dropdown-item size="md" value="one">
    
        One
      
  </cds-dropdown-item>
    
      <cds-dropdown-item size="md" value="two">
    
        Two
      
  </cds-dropdown-item>
    

    
    

    
  </cds-dropdown>
  ```


  ### `feature_flags`

  #### toggle/feature_flag

  ##### single

  ```heex
  <.feature_flags >
    <Graphene.CarbonComponents.toggle name="feature-flag-single" label_a="On" label_b="Off" toggled={true}>
      <:label_text>Label</:label_text>
    </Graphene.CarbonComponents.toggle>
  </.feature_flags>
  ```

  ```html
  <feature-flags id="feature-flag-single-single">
    
    <input type="hidden" id="checkbox-input" name="feature-flag-single" value="true">
  <cds-toggle checked id="checkbox" label-a="On" label-b="Off" name="feature-flag-single" size="" toggled id="checkbox" data-form-detail="toggled" data-form-event="cds-toggle-changed" data-form-input="checkbox-input" data-form-mode="boolean" phx-hook="Graphene.FormComponents.GrapheneFormBridge">
    
    
    
    <div slot="label-text">
      Label
    </div>
    
  </cds-toggle>


  </feature-flags>
  ```

  ##### multiple

  ```heex
  <.feature_flags >
    <Graphene.CarbonComponents.toggle name="feature-flag-a" label_a="On" label_b="Off" toggled={true}>
      <:label_text>Feature A</:label_text>
    </Graphene.CarbonComponents.toggle>
    <Graphene.CarbonComponents.toggle name="feature-flag-b" label_a="On" label_b="Off">
      <:label_text>Feature B</:label_text>
    </Graphene.CarbonComponents.toggle>
  </.feature_flags>
  ```

  ```html
  <feature-flags id="feature-flag-single-multiple">
    
    <input type="hidden" id="checkbox-input" name="feature-flag-a" value="true">
  <cds-toggle checked id="checkbox" label-a="On" label-b="Off" name="feature-flag-a" size="" toggled id="checkbox" data-form-detail="toggled" data-form-event="cds-toggle-changed" data-form-input="checkbox-input" data-form-mode="boolean" phx-hook="Graphene.FormComponents.GrapheneFormBridge">
    
    
    
    <div slot="label-text">
      Feature A
    </div>
    
  </cds-toggle>

  <input type="hidden" id="checkbox-input" name="feature-flag-b" value="false">
  <cds-toggle id="checkbox" label-a="On" label-b="Off" name="feature-flag-b" size="" id="checkbox" data-form-detail="toggled" data-form-event="cds-toggle-changed" data-form-input="checkbox-input" data-form-mode="boolean" phx-hook="Graphene.FormComponents.GrapheneFormBridge">
    
    
    
    <div slot="label-text">
      Feature B
    </div>
    
  </cds-toggle>


  </feature-flags>
  ```

  ##### disabled

  ```heex
  <.feature_flags >
    <Graphene.CarbonComponents.toggle name="feature-flag-disabled" label_a="On" label_b="Off" disabled={true}>
      <:label_text>Disabled</:label_text>
    </Graphene.CarbonComponents.toggle>
  </.feature_flags>
  ```

  ```html
  <feature-flags id="feature-flag-single-disabled">
    
    <input type="hidden" id="checkbox-input" name="feature-flag-disabled" value="false">
  <cds-toggle disabled id="checkbox" label-a="On" label-b="Off" name="feature-flag-disabled" size="" id="checkbox" data-form-detail="toggled" data-form-event="cds-toggle-changed" data-form-input="checkbox-input" data-form-mode="boolean" phx-hook="Graphene.FormComponents.GrapheneFormBridge">
    
    
    
    <div slot="label-text">
      Disabled
    </div>
    
  </cds-toggle>


  </feature-flags>
  ```


  ### `file_uploader`

  #### basic

  ##### default

  ```heex
  <.file_uploader
    id="basic-single-default"
    name="file_uploader_default"
    label_description="Max file size 500mb"
    label_title="Upload files"
  >
    <:button>Upload</:button>
    <:item state="complete">report.pdf</:item>
  </.file_uploader>
  ```

  ```html
  <input type="hidden" id="basic-single-default-input" name="file_uploader_default" value="">
  <cds-file-uploader label-description="Max file size 500mb" label-title="Upload files" id="basic-single-default" data-form-detail="checked" data-form-event="cds-file-uploader-button-changed" data-form-input="basic-single-default-input" data-form-mode="value" phx-hook="Graphene.FormComponents.GrapheneFormBridge">
    
    
    
      <cds-file-uploader-button slot="drop-container">
    
        Upload
      
  </cds-file-uploader-button>
    
    
      <cds-file-uploader-item size="md" state="complete">
    
        report.pdf
      
    
    
  </cds-file-uploader-item>
    
    
    

  </cds-file-uploader>
  ```

  ##### multiple

  ```heex
  <.file_uploader
    id="basic-single-multiple"
    name="file_uploader_multiple"
    label_description="PNG or SVG"
    label_title="Upload assets"
  >
    <:button accept=".png .svg" multiple={true}>Add files</:button>
    <:item state="uploading">logo.svg</:item>
    <:item state="edit">banner.png</:item>
  </.file_uploader>
  ```

  ```html
  <input type="hidden" id="basic-single-multiple-input" name="file_uploader_multiple" value="">
  <cds-file-uploader label-description="PNG or SVG" label-title="Upload assets" id="basic-single-multiple" data-form-detail="checked" data-form-event="cds-file-uploader-button-changed" data-form-input="basic-single-multiple-input" data-form-mode="value" phx-hook="Graphene.FormComponents.GrapheneFormBridge">
    
    
    
      <cds-file-uploader-button accept=".png .svg" multiple slot="drop-container">
    
        Add files
      
  </cds-file-uploader-button>
    
    
      <cds-file-uploader-item size="md" state="uploading">
    
        logo.svg
      
    
    
  </cds-file-uploader-item>
    
      <cds-file-uploader-item size="md" state="edit">
    
        banner.png
      
    
    
  </cds-file-uploader-item>
    
    
    

  </cds-file-uploader>
  ```

  ##### disabled

  ```heex
  <.file_uploader
    disabled
    id="basic-single-disabled"
    name="file_uploader_disabled"
    label_description="Uploads disabled"
    label_title="Disabled"
  >
    <:button disabled={true}>Upload</:button>
  </.file_uploader>
  ```

  ```html
  <input type="hidden" id="basic-single-disabled-input" name="file_uploader_disabled" value="">
  <cds-file-uploader disabled label-description="Uploads disabled" label-title="Disabled" id="basic-single-disabled" data-form-detail="checked" data-form-event="cds-file-uploader-button-changed" data-form-input="basic-single-disabled-input" data-form-mode="value" phx-hook="Graphene.FormComponents.GrapheneFormBridge">
    
    
    
      <cds-file-uploader-button disabled slot="drop-container">
    
        Upload
      
  </cds-file-uploader-button>
    
    
    
    

  </cds-file-uploader>
  ```


  #### upload

  ##### example

  ```heex
  <div style="display: grid; gap: 1.5rem; max-width: 36rem; position: relative;">
          <div
            id="file-uploader-bridge"
            phx-hook={"\#{inspect(__MODULE__)}.CarbonFileUploaderBridge"}
            data-accept=".pdf .png .txt"
          >
            <.file_uploader
              id="file-uploader"
              name="file_uploader_upload"
              label_title="Upload evidence"
              label_description="PDF, PNG, or TXT (max 5 MB)"
            >
              <:button>Select files</:button>

            <%= for entry <- @selected_files do %>
              <.file_uploader_item
                id={"file-upload-entry-\#{entry.id}"}
                data-file-id={entry.id}
                state="edit"
              >
                {entry.name} ({format_size(entry.size)})
              </.file_uploader_item>
            <% end %>

            <%= for file <- @uploaded_files do %>
              <.file_uploader_item
                id={"file-upload-complete-\#{file.id}"}
                data-file-id={file.id}
                state="complete"
              >
                {file.name} ({format_size(file.size)}) —
                <code data-testid="carbon-file-upload-hash">{file.hash}</code>
              </.file_uploader_item>
            <% end %>
            </.file_uploader>
          </div>

          <.file_uploader_bridge_hook />

          <div style="display: flex; gap: 0.75rem; margin-top: 0.75rem;">
            <.button kind="secondary" type="button" phx-click="clear_uploads">
              Clear
            </.button>
            <.button
              kind="primary"
              type="button"
              phx-click="upload_submit"
              data-testid="carbon-file-upload-submit"
              disabled={@selected_files == []}
            >
              Upload & compute hash
            </.button>
          </div>

      </div>
  ```

  ```html
  <div style="display: grid; gap: 1.5rem; max-width: 36rem; position: relative;">
      <div id="file-uploader-bridge" phx-hook="Storybook.CarbonComponents.FileUploader.Upload.CarbonFileUploaderBridge" data-accept=".pdf .png .txt">
        <input type="hidden" id="file-uploader-input" name="file_uploader_upload" value="">
  <cds-file-uploader label-description="PDF, PNG, or TXT (max 5 MB)" label-title="Upload evidence" id="file-uploader" data-form-detail="checked" data-form-event="cds-file-uploader-button-changed" data-form-input="file-uploader-input" data-form-mode="value" phx-hook="Graphene.FormComponents.GrapheneFormBridge">
    
    
    
      <cds-file-uploader-button slot="drop-container">
    
        Select files
      
  </cds-file-uploader-button>
    
    
    
          

        
        

  </cds-file-uploader>

      </div>

      

      <div style="display: flex; gap: 0.75rem; margin-top: 0.75rem;">
        <cds-button kind="secondary" link-role="button" size="lg" tab-index="0" tooltip-alignment="" tooltip-position="top" type="button" phx-click="clear_uploads">
    
          Clear
        
    
  </cds-button>
        <cds-button disabled kind="primary" link-role="button" size="lg" tab-index="0" tooltip-alignment="" tooltip-position="top" type="button" phx-click="upload_submit" data-testid="carbon-file-upload-submit">
    
          Upload & compute hash
        
    
  </cds-button>
      </div>

  </div>
  ```


  ### `fluid_number_input`

  #### basic

  ##### default

  ```heex
  <.fluid_number_input name="fluid-number-default" value="10">
    <:label_text>Quantity</:label_text>
  </.fluid_number_input>
  ```

  ```html
  <input type="hidden" id="fluid-number-default-input" name="fluid-number-default" value="10">
  <cds-fluid-number-input decrement-button-assistive-text="decrease number input" default-value="10" hidePasswordLabel="Hide password" increment-button-assistive-text="increase number input" max="Infty" min="-Infty" name="fluid-number-default" required-validity-message="Please fill out this field." showPasswordLabel="Show password" size="md" step="1" tooltipAlignment="center" tooltipDirection="bottom" type="text" id="basic-single-default" data-form-detail="checked" data-form-event="cds-number-input" data-form-input="fluid-number-default-input" data-form-mode="value" phx-hook="Graphene.FormComponents.GrapheneFormBridge">
    
    
    
    <div slot="label-text">
      Quantity
    </div>
    
  </cds-fluid-number-input>
  ```

  ##### helper_text

  ```heex
  <.fluid_number_input name="fluid-number-helper" value="2">
    <:label_text>Seats</:label_text>
    <:helper_text>Available seats</:helper_text>
  </.fluid_number_input>
  ```

  ```html
  <input type="hidden" id="fluid-number-helper-input" name="fluid-number-helper" value="2">
  <cds-fluid-number-input decrement-button-assistive-text="decrease number input" default-value="2" hidePasswordLabel="Hide password" increment-button-assistive-text="increase number input" max="Infty" min="-Infty" name="fluid-number-helper" required-validity-message="Please fill out this field." showPasswordLabel="Show password" size="md" step="1" tooltipAlignment="center" tooltipDirection="bottom" type="text" id="basic-single-helper-text" data-form-detail="checked" data-form-event="cds-number-input" data-form-input="fluid-number-helper-input" data-form-mode="value" phx-hook="Graphene.FormComponents.GrapheneFormBridge">
    
    
    <div slot="helper-text">
      Available seats
    </div>
    <div slot="label-text">
      Seats
    </div>
    
  </cds-fluid-number-input>
  ```

  ##### invalid

  ```heex
  <.fluid_number_input name="fluid-number-invalid" value="0">
    <:label_text>Licenses</:label_text>
    <:validity_message>Minimum is 1</:validity_message>
  </.fluid_number_input>
  ```

  ```html
  <input type="hidden" id="fluid-number-invalid-input" name="fluid-number-invalid" value="0">
  <cds-fluid-number-input decrement-button-assistive-text="decrease number input" default-value="0" hidePasswordLabel="Hide password" increment-button-assistive-text="increase number input" max="Infty" min="-Infty" name="fluid-number-invalid" required-validity-message="Please fill out this field." showPasswordLabel="Show password" size="md" step="1" tooltipAlignment="center" tooltipDirection="bottom" type="text" id="basic-single-invalid" data-form-detail="checked" data-form-event="cds-number-input" data-form-input="fluid-number-invalid-input" data-form-mode="value" phx-hook="Graphene.FormComponents.GrapheneFormBridge">
    
    
    
    <div slot="label-text">
      Licenses
    </div>
    <div slot="validity-message">
      Minimum is 1
    </div>
  </cds-fluid-number-input>
  ```


  ### `fluid_search`

  #### basic

  ##### default

  ```heex
  <.fluid_search name="fluid-search-default" placeholder="Search" label_text="Search"/>
  ```

  ```html
  <input type="hidden" id="fluid-search-default-input" name="fluid-search-default" value="">
  <cds-fluid-search autocomplete="off" label-text="Search" name="fluid-search-default" placeholder="Search" size="md" id="basic-single-default" data-form-detail="checked" data-form-event="cds-search-input" data-form-input="fluid-search-default-input" data-form-mode="value" phx-hook="Graphene.FormComponents.GrapheneFormBridge">
    
  </cds-fluid-search>
  ```

  ##### expandable

  ```heex
  <.fluid_search name="fluid-search-expandable" label_text="Search" expandable expanded/>
  ```

  ```html
  <input type="hidden" id="fluid-search-expandable-input" name="fluid-search-expandable" value="">
  <cds-fluid-search autocomplete="off" expandable expanded label-text="Search" name="fluid-search-expandable" placeholder="Search" size="md" id="basic-single-expandable" data-form-detail="checked" data-form-event="cds-search-input" data-form-input="fluid-search-expandable-input" data-form-mode="value" phx-hook="Graphene.FormComponents.GrapheneFormBridge">
    
  </cds-fluid-search>
  ```

  ##### disabled

  ```heex
  <.fluid_search disabled name="fluid-search-disabled" label_text="Search"/>
  ```

  ```html
  <input type="hidden" id="fluid-search-disabled-input" name="fluid-search-disabled" value="">
  <cds-fluid-search autocomplete="off" disabled label-text="Search" name="fluid-search-disabled" placeholder="Search" size="md" id="basic-single-disabled" data-form-detail="checked" data-form-event="cds-search-input" data-form-input="fluid-search-disabled-input" data-form-mode="value" phx-hook="Graphene.FormComponents.GrapheneFormBridge">
    
  </cds-fluid-search>
  ```

  ##### group: sizes

  ```heex
  <.fluid_search name="fluid-search-sm" size="sm" label_text="Size sm"/>
  <.fluid_search name="fluid-search-md" size="md" label_text="Size md"/>
  <.fluid_search name="fluid-search-lg" size="lg" label_text="Size lg"/>
  ```

  ```html
  <input type="hidden" id="fluid-search-sm-input" name="fluid-search-sm" value="">
  <cds-fluid-search autocomplete="off" label-text="Size sm" name="fluid-search-sm" placeholder="Search" size="sm" id="basic-sizes-sm" data-form-detail="checked" data-form-event="cds-search-input" data-form-input="fluid-search-sm-input" data-form-mode="value" phx-hook="Graphene.FormComponents.GrapheneFormBridge">
    
  </cds-fluid-search>

  <input type="hidden" id="fluid-search-md-input" name="fluid-search-md" value="">
  <cds-fluid-search autocomplete="off" label-text="Size md" name="fluid-search-md" placeholder="Search" size="md" id="basic-sizes-md" data-form-detail="checked" data-form-event="cds-search-input" data-form-input="fluid-search-md-input" data-form-mode="value" phx-hook="Graphene.FormComponents.GrapheneFormBridge">
    
  </cds-fluid-search>

  <input type="hidden" id="fluid-search-lg-input" name="fluid-search-lg" value="">
  <cds-fluid-search autocomplete="off" label-text="Size lg" name="fluid-search-lg" placeholder="Search" size="lg" id="basic-sizes-lg" data-form-detail="checked" data-form-event="cds-search-input" data-form-input="fluid-search-lg-input" data-form-mode="value" phx-hook="Graphene.FormComponents.GrapheneFormBridge">
    
  </cds-fluid-search>
  ```


  ### `fluid_select`

  #### basic

  ##### default

  ```heex
  <.fluid_select id="basic-single-default" name="fluid-select-default">
    <:label_text>Select an option</:label_text>
    <:item value="">Choose one</:item>
    <:item value="option-1">Option 1</:item>
    <:item value="option-2">Option 2</:item>
    <:item value="option-3">Option 3</:item>
  </.fluid_select>
  ```

  ```html
  <input type="hidden" id="basic-single-default-input" name="fluid-select-default" value="">
  <cds-fluid-select name="fluid-select-default" required-validity-message="Please fill out this field." size="md" id="basic-single-default" data-form-detail="checked" data-form-event="cds-select-selected" data-form-input="basic-single-default-input" data-form-mode="value" phx-hook="Graphene.FormComponents.GrapheneFormBridge">
    
    
    <div slot="label-text">
      Select an option
    </div>
    
    
    
      <cds-select-item value="">
    
        Choose one
      
  </cds-select-item>
    
      <cds-select-item value="option-1">
    
        Option 1
      
  </cds-select-item>
    
      <cds-select-item value="option-2">
    
        Option 2
      
  </cds-select-item>
    
      <cds-select-item value="option-3">
    
        Option 3
      
  </cds-select-item>
    

    
    
    
    

    
    
    
  </cds-fluid-select>
  ```

  ##### inline

  ```heex
  <.fluid_select id="basic-single-inline" name="fluid-select-inline" inline>
    <:label_text>Inline</:label_text>
    <:item value="alpha">Alpha</:item>
    <:item value="beta">Beta</:item>
  </.fluid_select>
  ```

  ```html
  <input type="hidden" id="basic-single-inline-input" name="fluid-select-inline" value="">
  <cds-fluid-select inline name="fluid-select-inline" required-validity-message="Please fill out this field." size="md" id="basic-single-inline" data-form-detail="checked" data-form-event="cds-select-selected" data-form-input="basic-single-inline-input" data-form-mode="value" phx-hook="Graphene.FormComponents.GrapheneFormBridge">
    
    
    <div slot="label-text">
      Inline
    </div>
    
    
    
      <cds-select-item value="alpha">
    
        Alpha
      
  </cds-select-item>
    
      <cds-select-item value="beta">
    
        Beta
      
  </cds-select-item>
    

    
    
    
    

    
    
    
  </cds-fluid-select>
  ```

  ##### invalid

  ```heex
  <.fluid_select
    id="basic-single-invalid"
    invalid
    name="fluid-select-invalid"
    invalid_text="Pick a value"
  >
    <:label_text>Required</:label_text>
    <:item value="one">One</:item>
    <:item value="two">Two</:item>
  </.fluid_select>
  ```

  ```html
  <input type="hidden" id="basic-single-invalid-input" name="fluid-select-invalid" value="">
  <cds-fluid-select invalid invalid-text="Pick a value" name="fluid-select-invalid" required-validity-message="Please fill out this field." size="md" id="basic-single-invalid" data-form-detail="checked" data-form-event="cds-select-selected" data-form-input="basic-single-invalid-input" data-form-mode="value" phx-hook="Graphene.FormComponents.GrapheneFormBridge">
    
    
    <div slot="label-text">
      Required
    </div>
    
    
    
      <cds-select-item value="one">
    
        One
      
  </cds-select-item>
    
      <cds-select-item value="two">
    
        Two
      
  </cds-select-item>
    

    
    
    
    

    
    
    
  </cds-fluid-select>
  ```


  ### `fluid_text_input`

  #### basic

  ##### default

  ```heex
  <.fluid_text_input name="fluid-text-input-default" value="">
    <:label_text>First name</:label_text>
  </.fluid_text_input>
  ```

  ```html
  <input type="hidden" id="fluid-text-input-default-input" name="fluid-text-input-default" value="">
  <cds-fluid-text-input hidePasswordLabel="Hide password" name="fluid-text-input-default" required-validity-message="Please fill out this field." showPasswordLabel="Show password" size="md" tooltipAlignment="center" tooltipDirection="bottom" type="text" value="" id="basic-single-default" data-form-detail="checked" data-form-event="input" data-form-input="fluid-text-input-default-input" data-form-mode="value" phx-hook="Graphene.FormComponents.GrapheneFormBridge">
    
    
    
    <div slot="label-text">
      First name
    </div>
    
  </cds-fluid-text-input>
  ```

  ##### helper_text

  ```heex
  <.fluid_text_input name="fluid-text-input-helper" value="Ada">
    <:label_text>Name</:label_text>
    <:helper_text>As shown on your ID</:helper_text>
  </.fluid_text_input>
  ```

  ```html
  <input type="hidden" id="fluid-text-input-helper-input" name="fluid-text-input-helper" value="Ada">
  <cds-fluid-text-input hidePasswordLabel="Hide password" name="fluid-text-input-helper" required-validity-message="Please fill out this field." showPasswordLabel="Show password" size="md" tooltipAlignment="center" tooltipDirection="bottom" type="text" value="Ada" id="basic-single-helper-text" data-form-detail="checked" data-form-event="input" data-form-input="fluid-text-input-helper-input" data-form-mode="value" phx-hook="Graphene.FormComponents.GrapheneFormBridge">
    
    
    <div slot="helper-text">
      As shown on your ID
    </div>
    <div slot="label-text">
      Name
    </div>
    
  </cds-fluid-text-input>
  ```

  ##### invalid

  ```heex
  <.fluid_text_input name="fluid-text-input-invalid" value="">
    <:label_text>Username</:label_text>
    <:validity_message>Required</:validity_message>
  </.fluid_text_input>
  ```

  ```html
  <input type="hidden" id="fluid-text-input-invalid-input" name="fluid-text-input-invalid" value="">
  <cds-fluid-text-input hidePasswordLabel="Hide password" name="fluid-text-input-invalid" required-validity-message="Please fill out this field." showPasswordLabel="Show password" size="md" tooltipAlignment="center" tooltipDirection="bottom" type="text" value="" id="basic-single-invalid" data-form-detail="checked" data-form-event="input" data-form-input="fluid-text-input-invalid-input" data-form-mode="value" phx-hook="Graphene.FormComponents.GrapheneFormBridge">
    
    
    
    <div slot="label-text">
      Username
    </div>
    <div slot="validity-message">
      Required
    </div>
  </cds-fluid-text-input>
  ```


  ### `fluid_textarea`

  #### basic

  ##### default

  ```heex
  <.fluid_textarea id="basic-single-default" name="fluid-textarea-default" rows="3">
    <:label_text>Notes</:label_text>
  </.fluid_textarea>
  ```

  ```html
  <input type="hidden" id="basic-single-default-input" name="fluid-textarea-default" value="">
  <cds-fluid-textarea hidePasswordLabel="Hide password" name="fluid-textarea-default" required-validity-message="Please fill out this field." rows="3" showPasswordLabel="Show password" size="md" tooltipAlignment="center" tooltipDirection="bottom" type="text" id="basic-single-default" data-form-detail="checked" data-form-event="input" data-form-input="basic-single-default-input" data-form-mode="value" phx-hook="Graphene.FormComponents.GrapheneFormBridge">
    
    
    
    <div slot="label-text">
      Notes
    </div>
    
  </cds-fluid-textarea>
  ```

  ##### helper_text

  ```heex
  <.fluid_textarea id="basic-single-helper-text" name="fluid-textarea-helper" rows="4">
    <:label_text>Description</:label_text>
    <:helper_text>Max 300 characters</:helper_text>
  </.fluid_textarea>
  ```

  ```html
  <input type="hidden" id="basic-single-helper-text-input" name="fluid-textarea-helper" value="">
  <cds-fluid-textarea hidePasswordLabel="Hide password" name="fluid-textarea-helper" required-validity-message="Please fill out this field." rows="4" showPasswordLabel="Show password" size="md" tooltipAlignment="center" tooltipDirection="bottom" type="text" id="basic-single-helper-text" data-form-detail="checked" data-form-event="input" data-form-input="basic-single-helper-text-input" data-form-mode="value" phx-hook="Graphene.FormComponents.GrapheneFormBridge">
    
    
    <div slot="helper-text">
      Max 300 characters
    </div>
    <div slot="label-text">
      Description
    </div>
    
  </cds-fluid-textarea>
  ```

  ##### invalid

  ```heex
  <.fluid_textarea id="basic-single-invalid" name="fluid-textarea-invalid" rows="3">
    <:label_text>Reason</:label_text>
    <:validity_message>Required</:validity_message>
  </.fluid_textarea>
  ```

  ```html
  <input type="hidden" id="basic-single-invalid-input" name="fluid-textarea-invalid" value="">
  <cds-fluid-textarea hidePasswordLabel="Hide password" name="fluid-textarea-invalid" required-validity-message="Please fill out this field." rows="3" showPasswordLabel="Show password" size="md" tooltipAlignment="center" tooltipDirection="bottom" type="text" id="basic-single-invalid" data-form-detail="checked" data-form-event="input" data-form-input="basic-single-invalid-input" data-form-mode="value" phx-hook="Graphene.FormComponents.GrapheneFormBridge">
    
    
    
    <div slot="label-text">
      Reason
    </div>
    <div slot="validity-message">
      Required
    </div>
  </cds-fluid-textarea>
  ```


  ### `form`

  ##### example

  ```heex
  <div style="display: grid; gap: 2rem;">
        <Graphene.CarbonComponents.form>
          <.text_input id="form-name" name="name" value="Ada Lovelace">
            <:label_text>Name</:label_text>
          </.text_input>
          <.text_input id="form-role" name="role" value="Engineer">
            <:label_text>Role</:label_text>
          </.text_input>
          <.button type="submit">Submit</.button>
        </Graphene.CarbonComponents.form>

        <Graphene.CarbonComponents.form>
          <.text_input id="form-email" name="email" value="ada@graphene.dev" type="email">
            <:label_text>Email</:label_text>
          </.text_input>
          <.password_input id="form-password" name="password" value="password">
            <:label_text>Password</:label_text>
          </.password_input>
          <.button kind="secondary" type="submit">Create account</.button>
        </Graphene.CarbonComponents.form>
      </div>
  ```

  ```html
  <div style="display: grid; gap: 2rem;">
    <form>
    
    
    
    <cds-form>
    
      
      <input type="hidden" id="name-input" name="name" value="Ada Lovelace">
  <cds-text-input hidePasswordLabel="Hide password" name="name" required-validity-message="Please fill out this field." showPasswordLabel="Show password" size="md" tooltipAlignment="center" tooltipDirection="bottom" type="text" value="Ada Lovelace" id="form-name" data-form-detail="checked" data-form-event="input" data-form-input="name-input" data-form-mode="value" phx-hook="Graphene.FormComponents.GrapheneFormBridge">
    
        
    
    <div slot="label-text">
      Name
    </div>
    
  </cds-text-input>

      <input type="hidden" id="role-input" name="role" value="Engineer">
  <cds-text-input hidePasswordLabel="Hide password" name="role" required-validity-message="Please fill out this field." showPasswordLabel="Show password" size="md" tooltipAlignment="center" tooltipDirection="bottom" type="text" value="Engineer" id="form-role" data-form-detail="checked" data-form-event="input" data-form-input="role-input" data-form-mode="value" phx-hook="Graphene.FormComponents.GrapheneFormBridge">
    
        
    
    <div slot="label-text">
      Role
    </div>
    
  </cds-text-input>

      <cds-button kind="primary" link-role="button" size="lg" tab-index="0" tooltip-alignment="" tooltip-position="top" type="submit">
    Submit
    
  </cds-button>
    
    
  </cds-form>

  </form>

    <form>
    
    
    
    <cds-form>
    
      
      <input type="hidden" id="email-input" name="email" value="ada@graphene.dev">
  <cds-text-input hidePasswordLabel="Hide password" name="email" required-validity-message="Please fill out this field." showPasswordLabel="Show password" size="md" tooltipAlignment="center" tooltipDirection="bottom" type="email" value="ada@graphene.dev" id="form-email" data-form-detail="checked" data-form-event="input" data-form-input="email-input" data-form-mode="value" phx-hook="Graphene.FormComponents.GrapheneFormBridge">
    
        
    
    <div slot="label-text">
      Email
    </div>
    
  </cds-text-input>

      <input type="hidden" id="password-input" name="password" value="password">
  <cds-password-input hide-password-label="Hide password" name="password" required-validity-message="Please fill out this field." show-password-label="Show password" size="md" tooltip-alignment="center" tooltip-position="bottom" type="password" value="password" id="form-password" data-form-detail="checked" data-form-event="input" data-form-input="password-input" data-form-mode="value" phx-hook="Graphene.FormComponents.GrapheneFormBridge">
    
        
    
    <div slot="label-text">
      Password
    </div>
    
  </cds-password-input>

      <cds-button kind="secondary" link-role="button" size="lg" tab-index="0" tooltip-alignment="" tooltip-position="top" type="submit">
    Create account
    
  </cds-button>
    
    
  </cds-form>

  </form>
  </div>
  ```


  ### `form_components`

  ##### example

  ```heex
  <div style="display: grid; gap: 2rem;">
        <div id="form-components-demo">
          <form id="form-components-form" phx-change="form_change" phx-submit="form_submit">
            <div style="display: grid; gap: 1.5rem;">
              <div style="display: grid; gap: 0.75rem;">
                <h3>Boolean inputs</h3>
                <.checkbox field={@form[:subscribe]} label_text="Receive updates" />
                <.toggle field={@form[:feature]} label_a="On" label_b="Off">
                  <:label_text>Enable feature</:label_text>
                </.toggle>
              </div>

              <div style="display: grid; gap: 0.75rem;">
                <h3>Radio group</h3>
                <.radio_button_group field={@form[:plan]} legend_text="Choose a plan">
                  <CoreComponents.radio_button value="starter" label_text="Starter" />
                  <CoreComponents.radio_button value="pro" label_text="Pro" />
                  <CoreComponents.radio_button value="enterprise" label_text="Enterprise" />
                </.radio_button_group>
              </div>

              <div style="display: grid; gap: 0.75rem;">
                <h3>Numbers</h3>
                <.number_input field={@form[:quantity]} min="0" max="Infinity">
                  <:label_text>Quantity</:label_text>
                </.number_input>
                <.fluid_number_input field={@form[:fluid_quantity]} min="0" max="Infinity">
                  <:label_text>Fluid quantity</:label_text>
                </.fluid_number_input>
                <.slider
                  field={@form[:slo]}
                  id={@form[:slo].id}
                  name={@form[:slo].name}
                  value={@form[:slo].value}
                  min="0"
                  max="100"
                  step="5"
                >
                  <:label_text>Utilization target</:label_text>
                </.slider>
              </div>

              <div style="display: grid; gap: 0.75rem;">
                <h3>Text</h3>
                <.text_input field={@form[:name]} label="Name" />
                <.fluid_text_input field={@form[:title]} label="Title" />
                <.password_input field={@form[:password]} label="Password" />
                <.textarea field={@form[:bio]} label="Bio" />
                <.fluid_textarea field={@form[:notes]} label="Notes" />
              </div>

              <div style="display: grid; gap: 0.75rem;">
                <h3>Search</h3>
                <.search field={@form[:search]} label_text="Search" />
                <.fluid_search field={@form[:fluid_search]} label_text="Fluid search" />
              </div>

              <div style="display: grid; gap: 0.75rem;">
                <h3>Selects</h3>
                <.select field={@form[:select]}>
                  <:label_text>Select option</:label_text>
                  <:item value="option-1">Option 1</:item>
                  <:item value="option-2">Option 2</:item>
                  <:item value="option-3">Option 3</:item>
                </.select>
                <.fluid_select field={@form[:fluid_select]}>
                  <:label_text>Fluid select</:label_text>
                  <:item value="option-1">Option 1</:item>
                  <:item value="option-2">Option 2</:item>
                  <:item value="option-3">Option 3</:item>
                </.fluid_select>
                <.dropdown field={@form[:dropdown]} label="Dropdown">
                  <:item value="option-1">Option 1</:item>
                  <:item value="option-2">Option 2</:item>
                  <:item value="option-3">Option 3</:item>
                </.dropdown>
                <.combo_box field={@form[:combo]} label="Combo box">
                  <:item value="option-1">Option 1</:item>
                  <:item value="option-2">Option 2</:item>
                  <:item value="option-3">Option 3</:item>
                </.combo_box>
                <.multi_select field={@form[:multi]} label="Multi select">
                  <:item value="option-1">Option 1</:item>
                  <:item value="option-2">Option 2</:item>
                  <:item value="option-3">Option 3</:item>
                </.multi_select>
              </div>

              <div style="display: grid; gap: 0.75rem;">
                <h3>Date & time</h3>
                <.date_picker field={@form[:date]}>
                  <CoreComponents.date_picker_input
                    label_text="Start date"
                    placeholder="mm/dd/yyyy"
                    kind="single"
                  />
                </.date_picker>
                <.time_picker field={@form[:time]}>
                  <:label_text>Select time</:label_text>
                </.time_picker>
              </div>

              <div style="display: grid; gap: 0.75rem;">
                <h3>File upload</h3>
                <.file_uploader field={@form[:attachments]} label_title="Upload evidence">
                  <:button label="Add files" />
                  <:item state="complete">audit-report.pdf</:item>
                </.file_uploader>
              </div>
            </div>

            <div style="margin-top: 1.5rem;">
              <.button
                type="button"
                phx-click={JS.dispatch("submit", to: "#form-components-form")}
              >
                Send form state
              </.button>
            </div>
          </form>
        </div>

        <div style="display: grid; gap: 1.5rem;">
          <.event_panel
            title="Form params (phx-change)"
            state={@form_state}
            last_event={@change_event}
            pretty={true}
          />
          <.event_panel
            title="Submitted params (phx-submit)"
            state={@submitted_state}
            last_event={@submit_event}
            pretty={true}
          />
        </div>
      </div>
  ```

  ```html
  <div style="display: grid; gap: 2rem;">
    <div id="form-components-demo">
      <form id="form-components-form" phx-change="form_change" phx-submit="form_submit">
        <div style="display: grid; gap: 1.5rem;">
          <div style="display: grid; gap: 0.75rem;">
            <h3>Boolean inputs</h3>
            <input type="hidden" id="form_subscribe-input" name="form[subscribe]" value="true">
  <cds-checkbox checked id="checkbox" label-text="Receive updates" name="form[subscribe]" value id="form_subscribe" data-form-detail="checked" data-form-event="cds-checkbox-changed" data-form-input="form_subscribe-input" data-form-mode="boolean" phx-hook="Graphene.FormComponents.GrapheneFormBridge">
    
  </cds-checkbox>

            <input type="hidden" id="form_feature-input" name="form[feature]" value="false">
  <cds-toggle id="checkbox" label-a="On" label-b="Off" name="form[feature]" size="" id="form_feature" data-form-detail="toggled" data-form-event="cds-toggle-changed" data-form-input="form_feature-input" data-form-mode="boolean" phx-hook="Graphene.FormComponents.GrapheneFormBridge">
    
              
    
    <div slot="label-text">
      Enable feature
    </div>
    
  </cds-toggle>

          </div>

          <div style="display: grid; gap: 0.75rem;">
            <h3>Radio group</h3>
            <input type="hidden" id="form_plan-input" name="form[plan]" value="starter">
  <cds-radio-button-group label-position="right" legend-text="Choose a plan" name="form[plan]" orientation="horizontal" value="starter" id="form_plan" data-form-detail="checked" data-form-event="cds-radio-button-group-changed" data-form-input="form_plan-input" data-form-mode="value" phx-hook="Graphene.FormComponents.GrapheneFormBridge">
    
              <cds-radio-button label-position="right" label-text="Starter" orientation="horizontal" value="starter">
    
    
  </cds-radio-button>
              <cds-radio-button label-position="right" label-text="Pro" orientation="horizontal" value="pro">
    
    
  </cds-radio-button>
              <cds-radio-button label-position="right" label-text="Enterprise" orientation="horizontal" value="enterprise">
    
    
  </cds-radio-button>
            
  </cds-radio-button-group>

          </div>

          <div style="display: grid; gap: 0.75rem;">
            <h3>Numbers</h3>
            <input type="hidden" id="form_quantity-input" name="form[quantity]" value="2">
  <cds-number-input decrement-button-assistive-text="decrease number input" default-value="2" hidePasswordLabel="Hide password" increment-button-assistive-text="increase number input" max="Infinity" min="0" name="form[quantity]" required-validity-message="Please fill out this field." showPasswordLabel="Show password" size="md" step="1" tooltipAlignment="center" tooltipDirection="bottom" type="text" id="form_quantity" data-form-detail="checked" data-form-event="cds-number-input" data-form-input="form_quantity-input" data-form-mode="value" phx-hook="Graphene.FormComponents.GrapheneFormBridge">
    
              
    
    <div slot="label-text">
      Quantity
    </div>
    
  </cds-number-input>

            <input type="hidden" id="form_fluid_quantity-input" name="form[fluid_quantity]" value="4">
  <cds-fluid-number-input decrement-button-assistive-text="decrease number input" default-value="4" hidePasswordLabel="Hide password" increment-button-assistive-text="increase number input" max="Infinity" min="0" name="form[fluid_quantity]" required-validity-message="Please fill out this field." showPasswordLabel="Show password" size="md" step="1" tooltipAlignment="center" tooltipDirection="bottom" type="text" id="form_fluid_quantity" data-form-detail="checked" data-form-event="cds-number-input" data-form-input="form_fluid_quantity-input" data-form-mode="value" phx-hook="Graphene.FormComponents.GrapheneFormBridge">
    
              
    
    <div slot="label-text">
      Fluid quantity
    </div>
    
  </cds-fluid-number-input>

            <input type="hidden" id="form_slo-input" name="form[slo]" value="65">
  <cds-slider max="100" min="0" name="form[slo]" step="5" step-multiplier="4" value="65" id="form_slo" data-form-detail="checked" data-form-event="cds-slider-changed" data-form-input="form_slo-input" data-form-mode="value" phx-hook="Graphene.FormComponents.GrapheneFormBridge">
    
              
    <div slot="label-text">
      Utilization target
    </div>
    
    
    
  </cds-slider>

          </div>

          <div style="display: grid; gap: 0.75rem;">
            <h3>Text</h3>
            <input type="hidden" id="form_name-input" name="form[name]" value="Ada Lovelace">
  <cds-text-input hidePasswordLabel="Hide password" label="Name" name="form[name]" required-validity-message="Please fill out this field." showPasswordLabel="Show password" size="md" tooltipAlignment="center" tooltipDirection="bottom" type="text" value="Ada Lovelace" id="form_name" data-form-detail="checked" data-form-event="input" data-form-input="form_name-input" data-form-mode="value" phx-hook="Graphene.FormComponents.GrapheneFormBridge">
    
    
    
    
  </cds-text-input>

            <input type="hidden" id="form_title-input" name="form[title]" value="Engineer">
  <cds-fluid-text-input hidePasswordLabel="Hide password" label="Title" name="form[title]" required-validity-message="Please fill out this field." showPasswordLabel="Show password" size="md" tooltipAlignment="center" tooltipDirection="bottom" type="text" value="Engineer" id="form_title" data-form-detail="checked" data-form-event="input" data-form-input="form_title-input" data-form-mode="value" phx-hook="Graphene.FormComponents.GrapheneFormBridge">
    
    
    
    
  </cds-fluid-text-input>

            <input type="hidden" id="form_password-input" name="form[password]" value="password">
  <cds-password-input hide-password-label="Hide password" label="Password" name="form[password]" required-validity-message="Please fill out this field." show-password-label="Show password" size="md" tooltip-alignment="center" tooltip-position="bottom" type="password" value="password" id="form_password" data-form-detail="checked" data-form-event="input" data-form-input="form_password-input" data-form-mode="value" phx-hook="Graphene.FormComponents.GrapheneFormBridge">
    
    
    
    
  </cds-password-input>

            <input type="hidden" id="form_bio-input" name="form[bio]" value="Inventor of the first algorithm.">
  <cds-textarea hidePasswordLabel="Hide password" label="Bio" name="form[bio]" required-validity-message="Please fill out this field." rows="4" showPasswordLabel="Show password" size="md" tooltipAlignment="center" tooltipDirection="bottom" type="text" value="Inventor of the first algorithm." id="form_bio" data-form-detail="checked" data-form-event="input" data-form-input="form_bio-input" data-form-mode="value" phx-hook="Graphene.FormComponents.GrapheneFormBridge">
    
    
    
    
  </cds-textarea>

            <input type="hidden" id="form_notes-input" name="form[notes]" value="Prefers a concise summary.">
  <cds-fluid-textarea hidePasswordLabel="Hide password" label="Notes" name="form[notes]" required-validity-message="Please fill out this field." rows="4" showPasswordLabel="Show password" size="md" tooltipAlignment="center" tooltipDirection="bottom" type="text" value="Prefers a concise summary." id="form_notes" data-form-detail="checked" data-form-event="input" data-form-input="form_notes-input" data-form-mode="value" phx-hook="Graphene.FormComponents.GrapheneFormBridge">
    
    
    
    
  </cds-fluid-textarea>

          </div>

          <div style="display: grid; gap: 0.75rem;">
            <h3>Search</h3>
            <input type="hidden" id="form_search-input" name="form[search]" value="Ada">
  <cds-search autocomplete="off" label-text="Search" name="form[search]" placeholder="Search" size="md" value="Ada" id="form_search" data-form-detail="checked" data-form-event="cds-search-input" data-form-input="form_search-input" data-form-mode="value" phx-hook="Graphene.FormComponents.GrapheneFormBridge">
    
  </cds-search>

            <input type="hidden" id="form_fluid_search-input" name="form[fluid_search]" value="">
  <cds-fluid-search autocomplete="off" label-text="Fluid search" name="form[fluid_search]" placeholder="Search" size="md" value="" id="form_fluid_search" data-form-detail="checked" data-form-event="cds-search-input" data-form-input="form_fluid_search-input" data-form-mode="value" phx-hook="Graphene.FormComponents.GrapheneFormBridge">
    
  </cds-fluid-search>

          </div>

          <div style="display: grid; gap: 0.75rem;">
            <h3>Selects</h3>
            <input type="hidden" id="form_select-input" name="form[select]" value="option-1">
  <cds-select name="form[select]" required-validity-message="Please fill out this field." size="md" value="option-1" id="form_select" data-form-detail="checked" data-form-event="cds-select-selected" data-form-input="form_select-input" data-form-mode="value" phx-hook="Graphene.FormComponents.GrapheneFormBridge">
    
    
              
    
    <div slot="label-text">
      Select option
    </div>
    
    
      <cds-select-item value="option-1">
    
        Option 1
      
  </cds-select-item>
    
      <cds-select-item value="option-2">
    
        Option 2
      
  </cds-select-item>
    
      <cds-select-item value="option-3">
    
        Option 3
      
  </cds-select-item>
    

    
    
    
  </cds-select>

            <input type="hidden" id="form_fluid_select-input" name="form[fluid_select]" value="option-2">
  <cds-fluid-select name="form[fluid_select]" required-validity-message="Please fill out this field." size="md" value="option-2" id="form_fluid_select" data-form-detail="checked" data-form-event="cds-select-selected" data-form-input="form_fluid_select-input" data-form-mode="value" phx-hook="Graphene.FormComponents.GrapheneFormBridge">
    
    
              
    
    <div slot="label-text">
      Fluid select
    </div>
    
    
      <cds-select-item value="option-1">
    
        Option 1
      
  </cds-select-item>
    
      <cds-select-item value="option-2">
    
        Option 2
      
  </cds-select-item>
    
      <cds-select-item value="option-3">
    
        Option 3
      
  </cds-select-item>
    

    
    
    
  </cds-fluid-select>

            <input type="hidden" id="form_dropdown-input" name="form[dropdown]" value="option-1">
  <cds-dropdown direction="bottom" label="Dropdown" name="form[dropdown]" required-validity-message="Please fill out this field." size="md" type="" value="option-1" id="form_dropdown" data-form-detail="checked" data-form-event="cds-dropdown-selected" data-form-input="form_dropdown-input" data-form-mode="value" phx-hook="Graphene.FormComponents.GrapheneFormBridge">
    
    
              
    
    
      <cds-dropdown-item size="md" value="option-1">
    
        Option 1
      
  </cds-dropdown-item>
    
      <cds-dropdown-item size="md" value="option-2">
    
        Option 2
      
  </cds-dropdown-item>
    
      <cds-dropdown-item size="md" value="option-3">
    
        Option 3
      
  </cds-dropdown-item>
    

    
  </cds-dropdown>

            <input type="hidden" id="form_combo-input" name="form[combo]" value="option-2">
  <cds-combo-box clear-selection-label="Clear selection" direction="bottom" label="Combo box" name="form[combo]" required-validity-message="Please fill out this field." size="md" type="" value="option-2" id="form_combo" data-form-detail="checked" data-form-event="cds-combo-box-selected" data-form-input="form_combo-input" data-form-mode="value" phx-hook="Graphene.FormComponents.GrapheneFormBridge">
    
    
              
    
      <cds-combo-box-item size="md" value="option-1">
    
        Option 1
      
  </cds-combo-box-item>
    
      <cds-combo-box-item size="md" value="option-2">
    
        Option 2
      
  </cds-combo-box-item>
    
      <cds-combo-box-item size="md" value="option-3">
    
        Option 3
      
  </cds-combo-box-item>
    

  </cds-combo-box>

            <input type="hidden" id="form_multi-input" name="form[multi]" value="option-1">
  <cds-multi-select clear-selection-description="Total items selected: " clear-selection-text="To clear selection, press Delete or Backspace." direction="bottom" label="Multi select" locale="en" name="form[multi]" required-validity-message="Please fill out this field." selection-feedback="top-after-reopen" size="md" type="" value="option-1" id="form_multi" data-form-detail="checked" data-form-event="cds-multi-select-selected" data-form-input="form_multi-input" data-form-mode="value" phx-hook="Graphene.FormComponents.GrapheneFormBridge">
    
    
              
    
    
      <cds-multi-select-item size="md" value="option-1">
    
        Option 1
      
  </cds-multi-select-item>
    
      <cds-multi-select-item size="md" value="option-2">
    
        Option 2
      
  </cds-multi-select-item>
    
      <cds-multi-select-item size="md" value="option-3">
    
        Option 3
      
  </cds-multi-select-item>
    

    
  </cds-multi-select>

          </div>

          <div style="display: grid; gap: 0.75rem;">
            <h3>Date & time</h3>
            <input type="hidden" id="form_date-input" name="form[date]" value="2024-01-10">
  <cds-date-picker allow-input close-on-select name="form[date]" value="2024-01-10" id="form_date" data-form-detail="checked" data-form-event="cds-date-picker-changed" data-form-input="form_date-input" data-form-mode="value" phx-hook="Graphene.FormComponents.GrapheneFormBridge">
    
              <cds-date-picker-input color-scheme="" kind="single" label-text="Start date" placeholder="mm/dd/yyyy" size="md">
    
  </cds-date-picker-input>
            
  </cds-date-picker>

            <input type="hidden" id="form_time-input" name="form[time]" value="09:30">
  <cds-time-picker invalid-text="Invalid time format." max-length="5" name="form[time]" pattern="(1[012]|[1-9]):[0-5][0-9](\\s)?" placeholder="hh:mm" required-validity-message="Please fill out this field." size="md" type="text" value="09:30" warning-text="Warning message." id="form_time" data-form-detail="checked" data-form-event="change" data-form-input="form_time-input" data-form-mode="value" phx-hook="Graphene.FormComponents.GrapheneFormBridge">
    
              
    <div slot="label-text">
      Select time
    </div>
    
    
  </cds-time-picker>

          </div>

          <div style="display: grid; gap: 0.75rem;">
            <h3>File upload</h3>
            <input type="hidden" id="form_attachments-input" name="form[attachments]" value="">
  <cds-file-uploader label-title="Upload evidence" id="form_attachments" data-form-detail="checked" data-form-event="cds-file-uploader-button-changed" data-form-input="form_attachments-input" data-form-mode="value" phx-hook="Graphene.FormComponents.GrapheneFormBridge">
    
    
    
      <cds-file-uploader-button slot="drop-container">
    
        Add files
      
  </cds-file-uploader-button>
    
    
      <cds-file-uploader-item size="md" state="complete">
    
        audit-report.pdf
      
    
    
  </cds-file-uploader-item>
    
    
              

  </cds-file-uploader>

          </div>
        </div>

        <div style="margin-top: 1.5rem;">
          <cds-button kind="primary" link-role="button" size="lg" tab-index="0" tooltip-alignment="" tooltip-position="top" type="button" phx-click="[[&quot;dispatch&quot;,{&quot;to&quot;:&quot;#form-components-form&quot;,&quot;event&quot;:&quot;submit&quot;}]]">
    
            Send form state
          
    
  </cds-button>
        </div>
      </form>
    </div>

    <div style="display: grid; gap: 1.5rem;">
      <div class="psb-interactivity-panel">
    <h4>Form params (phx-change)</h4>
    <pre class="psb-event-state">%{}</pre>
    
  </div>
      <div class="psb-interactivity-panel">
    <h4>Submitted params (phx-submit)</h4>
    <pre class="psb-event-state">%{}</pre>
    
  </div>
    </div>
  </div>
  ```


  ### `form_group`

  ##### default

  ```heex
  <.form_group legend_text="Notification settings">
    <Graphene.CarbonComponents.checkbox id="form-group-email" label_text="Email" />
    <Graphene.CarbonComponents.checkbox id="form-group-sms" label_text="SMS" />
  </.form_group>
  ```

  ```html
  <cds-form-group legend-text="Notification settings" id="form-group-single-default">
    
    <input type="hidden" id="form-group-email-input" value="false">
  <cds-checkbox id="checkbox" label-text="Email" id="form-group-email" data-form-detail="checked" data-form-event="cds-checkbox-changed" data-form-input="form-group-email-input" data-form-mode="boolean" phx-hook="Graphene.FormComponents.GrapheneFormBridge">
    
  </cds-checkbox>

  <input type="hidden" id="form-group-sms-input" value="false">
  <cds-checkbox id="checkbox" label-text="SMS" id="form-group-sms" data-form-detail="checked" data-form-event="cds-checkbox-changed" data-form-input="form-group-sms-input" data-form-mode="boolean" phx-hook="Graphene.FormComponents.GrapheneFormBridge">
    
  </cds-checkbox>


  </cds-form-group>
  ```

  ##### with_message

  ```heex
  <.form_group message legend_text="Alerts" message_text="Pick at least one">
    <Graphene.CarbonComponents.checkbox id="form-group-product" label_text="Product updates" />
    <Graphene.CarbonComponents.checkbox id="form-group-security" label_text="Security" />
  </.form_group>
  ```

  ```html
  <cds-form-group legend-text="Alerts" message message-text="Pick at least one" id="form-group-single-with-message">
    
    <input type="hidden" id="form-group-product-input" value="false">
  <cds-checkbox id="checkbox" label-text="Product updates" id="form-group-product" data-form-detail="checked" data-form-event="cds-checkbox-changed" data-form-input="form-group-product-input" data-form-mode="boolean" phx-hook="Graphene.FormComponents.GrapheneFormBridge">
    
  </cds-checkbox>

  <input type="hidden" id="form-group-security-input" value="false">
  <cds-checkbox id="checkbox" label-text="Security" id="form-group-security" data-form-detail="checked" data-form-event="cds-checkbox-changed" data-form-input="form-group-security-input" data-form-mode="boolean" phx-hook="Graphene.FormComponents.GrapheneFormBridge">
    
  </cds-checkbox>


  </cds-form-group>
  ```

  ##### invalid

  ```heex
  <.form_group invalid message legend_text="Required" message_text="Select one option">
    <Graphene.CarbonComponents.checkbox id="form-group-a" label_text="Option A" />
    <Graphene.CarbonComponents.checkbox id="form-group-b" label_text="Option B" />
  </.form_group>
  ```

  ```html
  <cds-form-group invalid legend-text="Required" message message-text="Select one option" id="form-group-single-invalid">
    
    <input type="hidden" id="form-group-a-input" value="false">
  <cds-checkbox id="checkbox" label-text="Option A" id="form-group-a" data-form-detail="checked" data-form-event="cds-checkbox-changed" data-form-input="form-group-a-input" data-form-mode="boolean" phx-hook="Graphene.FormComponents.GrapheneFormBridge">
    
  </cds-checkbox>

  <input type="hidden" id="form-group-b-input" value="false">
  <cds-checkbox id="checkbox" label-text="Option B" id="form-group-b" data-form-detail="checked" data-form-event="cds-checkbox-changed" data-form-input="form-group-b-input" data-form-mode="boolean" phx-hook="Graphene.FormComponents.GrapheneFormBridge">
    
  </cds-checkbox>


  </cds-form-group>
  ```


  ### `grid`

  ##### default

  ```heex
  <.grid >
    <:column sm="2">Column 1</:column>
    <:column sm="2">Column 2</:column>
    <:column sm="2">Column 3</:column>
  </.grid>
  ```

  ```html
  <cds-grid id="grid-single-default">
    
    
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

  ##### condensed

  ```heex
  <.grid condensed>
    <:column sm="1">One</:column>
    <:column sm="1">Two</:column>
    <:column sm="1">Three</:column>
    <:column sm="1">Four</:column>
  </.grid>
  ```

  ```html
  <cds-grid condensed id="grid-single-condensed">
    
    
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

  ##### full_width

  ```heex
  <.grid full_width>
    <:column sm="2">Wide 1</:column>
    <:column sm="2">Wide 2</:column>
    <:column sm="2">Wide 3</:column>
  </.grid>
  ```

  ```html
  <cds-grid full-width id="grid-single-full-width">
    
    
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


  ### `heading`

  ##### default

  ```heex
  <.heading >
    Section heading
  </.heading>
  ```

  ```html
  <cds-heading id="heading-single-default">
    
    Section heading

  </cds-heading>
  ```

  ##### short

  ```heex
  <.heading >
    Overview
  </.heading>
  ```

  ```html
  <cds-heading id="heading-single-short">
    
    Overview

  </cds-heading>
  ```

  ##### long

  ```heex
  <.heading >
    Project timeline and deliverables
  </.heading>
  ```

  ```html
  <cds-heading id="heading-single-long">
    
    Project timeline and deliverables

  </cds-heading>
  ```


  ### `icon`

  ##### cursor_16

  ```heex
  <.icon name="3d-cursor" size="16"/>
  ```

  ```html
  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" id="icon-single-cursor-16" width="16px" height="16px" fill="currentColor" preserveAspectRatio="xMidYMid meet" aria-hidden>
    
    
    <path d="M13 4 4 4 4 13.01 6 13.01 6 6 13 6 13 4z"/><path d="M29.49,13.12l-9-5a1,1,0,0,0-1,0l-9,5A1,1,0,0,0,10,14V24a1,1,0,0,0,.52.87l9,5A1,1,0,0,0,20,30a1.05,1.05,0,0,0,.49-.13l9-5A1,1,0,0,0,30,24V14A1,1,0,0,0,29.49,13.12ZM19,27.3l-7-3.89V15.69l7,3.89Zm1-9.45L13.06,14,20,10.14,26.94,14Zm8,5.56L21,27.3V19.58l7-3.89Z"/>

  </svg>
  ```

  ##### add_20

  ```heex
  <.icon name="add" size="20"/>
  ```

  ```html
  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" id="icon-single-add-20" width="20px" height="20px" fill="currentColor" preserveAspectRatio="xMidYMid meet" aria-hidden>
    
    
    <path d="M17 15 17 8 15 8 15 15 8 15 8 17 15 17 15 24 17 24 17 17 24 17 24 15z"/>

  </svg>
  ```

  ##### account_32

  ```heex
  <.icon name="account" size="32"/>
  ```

  ```html
  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" id="icon-single-account-32" width="32px" height="32px" fill="currentColor" preserveAspectRatio="xMidYMid meet" aria-hidden>
    
    
    <path d="M8,14H19v2H8Zm0,5H21v2H8Z"/><path d="M28,4H4A2,2,0,0,0,2,6V26a2,2,0,0,0,2,2H28a2,2,0,0,0,2-2V6A2,2,0,0,0,28,4Zm0,2V8H4V6ZM4,26V10H28V26Z"/>

  </svg>
  ```


  ### `icon_button`

  ##### ghost

  ```heex
  <.icon_button kind="ghost" tooltip_text="Settings">
    <:icon name="3d-cursor" size="16" />
  </.icon_button>
  ```

  ```html
  <cds-icon-button align="top" close-on-activation enter-delay-ms="100" kind="ghost" leave-delay-ms="300" link-role="button" size="md" tab-index="0" tooltip-alignment="" tooltip-position="top" tooltip-text="Settings" type="button" id="icon-button-single-ghost">
    
    
      
      
      
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" width="16px" height="16px" fill="currentColor" preserveAspectRatio="xMidYMid meet" aria-hidden>
    
    
    <path d="M13 4 4 4 4 13.01 6 13.01 6 6 13 6 13 4z"/><path d="M29.49,13.12l-9-5a1,1,0,0,0-1,0l-9,5A1,1,0,0,0,10,14V24a1,1,0,0,0,.52.87l9,5A1,1,0,0,0,20,30a1.05,1.05,0,0,0,.49-.13l9-5A1,1,0,0,0,30,24V14A1,1,0,0,0,29.49,13.12ZM19,27.3l-7-3.89V15.69l7,3.89Zm1-9.45L13.06,14,20,10.14,26.94,14Zm8,5.56L21,27.3V19.58l7-3.89Z"/>

  </svg>
      
    
    
    

    
  </cds-icon-button>
  ```

  ##### primary

  ```heex
  <.icon_button kind="primary" tooltip_text="Notifications">
    <:icon size="16">
      <svg width="16" height="16" viewBox="0 0 16 16">
        <rect x="2" y="2" width="12" height="12" fill="currentColor" />
      </svg>
    </:icon>
  </.icon_button>
  ```

  ```html
  <cds-icon-button align="top" close-on-activation enter-delay-ms="100" kind="primary" leave-delay-ms="300" link-role="button" size="md" tab-index="0" tooltip-alignment="" tooltip-position="top" tooltip-text="Notifications" type="button" id="icon-button-single-primary">
    
    
      
      
      
        <cds-icon class="" size="16">
    
          
    <svg width="16" height="16" viewBox="0 0 16 16">
      <rect x="2" y="2" width="12" height="12" fill="currentColor"></rect>
    </svg>

        
  </cds-icon>
      
    
    
    

    
  </cds-icon-button>
  ```

  ##### danger

  ```heex
  <.icon_button kind="danger" tooltip_text="Delete">
    <:icon size="16">
      <svg width="16" height="16" viewBox="0 0 16 16">
        <polygon points="8,2 14,14 2,14" fill="currentColor" />
      </svg>
    </:icon>
  </.icon_button>
  ```

  ```html
  <cds-icon-button align="top" close-on-activation enter-delay-ms="100" kind="danger" leave-delay-ms="300" link-role="button" size="md" tab-index="0" tooltip-alignment="" tooltip-position="top" tooltip-text="Delete" type="button" id="icon-button-single-danger">
    
    
      
      
      
        <cds-icon class="" size="16">
    
          
    <svg width="16" height="16" viewBox="0 0 16 16">
      <polygon points="8,2 14,14 2,14" fill="currentColor"></polygon>
    </svg>

        
  </cds-icon>
      
    
    
    

    
  </cds-icon-button>
  ```


  ### `icon_indicator`

  ##### failed

  ```heex
  <.icon_indicator label="Failed" kind="failed"/>
  ```

  ```html
  <cds-icon-indicator kind="failed" label="Failed" size="16" id="icon-indicator-single-failed">
    
  </cds-icon-indicator>
  ```

  ##### succeeded

  ```heex
  <.icon_indicator label="Succeeded" kind="succeeded"/>
  ```

  ```html
  <cds-icon-indicator kind="succeeded" label="Succeeded" size="16" id="icon-indicator-single-succeeded">
    
  </cds-icon-indicator>
  ```

  ##### informative

  ```heex
  <.icon_indicator label="Informative" kind="informative"/>
  ```

  ```html
  <cds-icon-indicator kind="informative" label="Informative" size="16" id="icon-indicator-single-informative">
    
  </cds-icon-indicator>
  ```

  ##### large

  ```heex
  <.icon_indicator label="Large" size="20" kind="succeeded"/>
  ```

  ```html
  <cds-icon-indicator kind="succeeded" label="Large" size="20" id="icon-indicator-single-large">
    
  </cds-icon-indicator>
  ```


  ### `inline_loading`

  #### basic

  ##### active

  ```heex
  <.inline_loading status="active">
    Loading...
  </.inline_loading>
  ```

  ```html
  <cds-inline-loading icon-description="Loading" status="active" success-delay="1500" id="basic-single-active">
    
    Loading...

  </cds-inline-loading>
  ```

  ##### finished

  ```heex
  <.inline_loading status="finished">
    Complete
  </.inline_loading>
  ```

  ```html
  <cds-inline-loading icon-description="Loading" status="finished" success-delay="1500" id="basic-single-finished">
    
    Complete

  </cds-inline-loading>
  ```

  ##### error

  ```heex
  <.inline_loading status="error">
    Failed
  </.inline_loading>
  ```

  ```html
  <cds-inline-loading icon-description="Loading" status="error" success-delay="1500" id="basic-single-error">
    
    Failed

  </cds-inline-loading>
  ```


  ### `inline_notification`

  #### notification/inline

  ##### info

  ```heex
  <.inline_notification kind="info">
    <:title>Updates available</:title>
    <:subtitle>Refresh to install the latest changes</:subtitle>
  </.inline_notification>
  ```

  ```html
  <cds-inline-notification kind="info" open id="inline-single-info">
    
    
    <div slot="subtitle">
      Refresh to install the latest changes
    </div>
    <div slot="title">
      Updates available
    </div>
  </cds-inline-notification>
  ```

  ##### warning

  ```heex
  <.inline_notification kind="warning">
    <:title>Storage almost full</:title>
    <:subtitle>Clean up old files</:subtitle>
  </.inline_notification>
  ```

  ```html
  <cds-inline-notification kind="warning" open id="inline-single-warning">
    
    
    <div slot="subtitle">
      Clean up old files
    </div>
    <div slot="title">
      Storage almost full
    </div>
  </cds-inline-notification>
  ```

  ##### success

  ```heex
  <.inline_notification kind="success">
    <:title>Saved</:title>
    <:subtitle>Your changes were saved</:subtitle>
  </.inline_notification>
  ```

  ```html
  <cds-inline-notification kind="success" open id="inline-single-success">
    
    
    <div slot="subtitle">
      Your changes were saved
    </div>
    <div slot="title">
      Saved
    </div>
  </cds-inline-notification>
  ```


  ### `layer`

  #### basic

  ##### base

  ```heex
  <.layer level="0">
    <div style="padding: 1rem; border: 1px solid #e0e0e0;">Base layer</div>
  </.layer>
  ```

  ```html
  <cds-layer level="0" id="basic-single-base">
    
    <div style="padding: 1rem; border: 1px solid #e0e0e0;">Base layer</div>

    
  </cds-layer>
  ```

  ##### nested

  ```heex
  <.layer level="0">
    <div style="padding: 1rem; border: 1px solid #e0e0e0;">
      Base layer
      <Graphene.CarbonComponents.layer level="1">
        <div style="margin-top: 0.5rem; padding: 1rem; border: 1px dashed #8d8d8d;">
          Nested layer
        </div>
      </Graphene.CarbonComponents.layer>
    </div>
  </.layer>
  ```

  ```html
  <cds-layer level="0" id="basic-single-nested">
    
    <div style="padding: 1rem; border: 1px solid #e0e0e0;">
    Base layer
    <cds-layer level="1">
    
      <div style="margin-top: 0.5rem; padding: 1rem; border: 1px dashed #8d8d8d;">
        Nested layer
      </div>
    
    
  </cds-layer>
  </div>

    
  </cds-layer>
  ```

  ##### deep

  ```heex
  <.layer level="0">
    <div style="padding: 1rem; border: 1px solid #e0e0e0;">
      Level 0
      <Graphene.CarbonComponents.layer level="1">
        <div style="margin-top: 0.5rem; padding: 1rem; border: 1px dashed #8d8d8d;">
          Level 1
          <Graphene.CarbonComponents.layer level="2">
            <div style="margin-top: 0.5rem; padding: 1rem; border: 1px dotted #525252;">
              Level 2
            </div>
          </Graphene.CarbonComponents.layer>
        </div>
      </Graphene.CarbonComponents.layer>
    </div>
  </.layer>
  ```

  ```html
  <cds-layer level="0" id="basic-single-deep">
    
    <div style="padding: 1rem; border: 1px solid #e0e0e0;">
    Level 0
    <cds-layer level="1">
    
      <div style="margin-top: 0.5rem; padding: 1rem; border: 1px dashed #8d8d8d;">
        Level 1
        <cds-layer level="2">
    
          <div style="margin-top: 0.5rem; padding: 1rem; border: 1px dotted #525252;">
            Level 2
          </div>
        
    
  </cds-layer>
      </div>
    
    
  </cds-layer>
  </div>

    
  </cds-layer>
  ```


  ### `loading`

  ##### active

  ```heex
  <.loading active description="Loading"/>
  ```

  ```html
  <cds-loading active description="Loading" id="loading-single-active">
    
  </cds-loading>
  ```

  ##### inactive

  ```heex
  <.loading description="Idle"/>
  ```

  ```html
  <cds-loading description="Idle" id="loading-single-inactive">
    
  </cds-loading>
  ```

  ##### small

  ```heex
  <.loading active size="sm" description="Loading"/>
  ```

  ```html
  <cds-loading active description="Loading" id="loading-single-small" size="sm">
    
  </cds-loading>
  ```


  ### `menu`

  ##### default

  ```heex
  <div class="psb" style="position: relative; min-height: 240px;">
    <.menu label="Actions" open size="lg" y={140} x={200}>
      <Graphene.CarbonComponents.menu_item label="First action" />
      <Graphene.CarbonComponents.menu_item label="Second action" />
      <Graphene.CarbonComponents.menu_item_divider />
      <Graphene.CarbonComponents.menu_item kind="danger" label="Danger action" />
    </.menu>
  </div>
  ```

  ```html
  <div class="psb" style="position: relative; min-height: 240px;">
    <cds-menu open size="lg" label="Actions" x="200" y="140" id="menu-single-default">
    
    <cds-menu-item kind="default" label="First action">
    
    
  </cds-menu-item>
  <cds-menu-item kind="default" label="Second action">
    
    
  </cds-menu-item>
  <cds-menu-item-divider>
    
  </cds-menu-item-divider>
  <cds-menu-item kind="danger" label="Danger action">
    
    
  </cds-menu-item>

  </cds-menu>

  </div>
  ```

  ##### secondary

  ```heex
  <div class="psb" style="position: relative; min-height: 240px;">
    <.menu label="More" open size="md" y={140} x={520}>
      <Graphene.CarbonComponents.menu_item label="Edit" />
      <Graphene.CarbonComponents.menu_item label="Duplicate" />
    </.menu>
  </div>
  ```

  ```html
  <div class="psb" style="position: relative; min-height: 240px;">
    <cds-menu open size="md" label="More" x="520" y="140" id="menu-single-secondary">
    
    <cds-menu-item kind="default" label="Edit">
    
    
  </cds-menu-item>
  <cds-menu-item kind="default" label="Duplicate">
    
    
  </cds-menu-item>

  </cds-menu>

  </div>
  ```

  ##### group: sizes

  ```heex
  <div class="psb" style="position: relative; min-height: 240px;">
    <.menu label="Menu" open size="sm" y={360} x={200}>
      <Graphene.CarbonComponents.menu_item label="Item A" />
      <Graphene.CarbonComponents.menu_item label="Item B" />
    </.menu>
  </div>

  <div class="psb" style="position: relative; min-height: 240px;">
    <.menu label="Menu" open size="md" y={360} x={420}>
      <Graphene.CarbonComponents.menu_item label="Item A" />
      <Graphene.CarbonComponents.menu_item label="Item B" />
    </.menu>
  </div>

  <div class="psb" style="position: relative; min-height: 240px;">
    <.menu label="Menu" open size="lg" y={360} x={640}>
      <Graphene.CarbonComponents.menu_item label="Item A" />
      <Graphene.CarbonComponents.menu_item label="Item B" />
    </.menu>
  </div>

  <div class="psb" style="position: relative; min-height: 240px;">
    <.menu label="Menu" open size="xl" y={360} x={860}>
      <Graphene.CarbonComponents.menu_item label="Item A" />
      <Graphene.CarbonComponents.menu_item label="Item B" />
    </.menu>
  </div>
  ```

  ```html
  <div class="psb" style="position: relative; min-height: 240px;">
    <cds-menu open size="sm" label="Menu" x="200" y="360" id="menu-sizes-sm">
    
    <cds-menu-item kind="default" label="Item A">
    
    
  </cds-menu-item>
  <cds-menu-item kind="default" label="Item B">
    
    
  </cds-menu-item>

  </cds-menu>

  </div>
  <div class="psb" style="position: relative; min-height: 240px;">
    <cds-menu open size="md" label="Menu" x="420" y="360" id="menu-sizes-md">
    
    <cds-menu-item kind="default" label="Item A">
    
    
  </cds-menu-item>
  <cds-menu-item kind="default" label="Item B">
    
    
  </cds-menu-item>

  </cds-menu>

  </div>
  <div class="psb" style="position: relative; min-height: 240px;">
    <cds-menu open size="lg" label="Menu" x="640" y="360" id="menu-sizes-lg">
    
    <cds-menu-item kind="default" label="Item A">
    
    
  </cds-menu-item>
  <cds-menu-item kind="default" label="Item B">
    
    
  </cds-menu-item>

  </cds-menu>

  </div>
  <div class="psb" style="position: relative; min-height: 240px;">
    <cds-menu open size="xl" label="Menu" x="860" y="360" id="menu-sizes-xl">
    
    <cds-menu-item kind="default" label="Item A">
    
    
  </cds-menu-item>
  <cds-menu-item kind="default" label="Item B">
    
    
  </cds-menu-item>

  </cds-menu>

  </div>
  ```


  ### `menu_button`

  ##### default

  ```heex
  <.menu_button label="Actions" size="lg" kind="primary">
    <:item label="First action" />
    <:item label="Second action" />
    <:item label="Third action" disabled />
  </.menu_button>
  ```

  ```html
  <cds-menu-button kind="primary" label="Actions" menu-alignment="bottom" menu-background-token="layer" size="lg" tab-index="0" id="menu-button-single-default">
    
    <cds-menu>
    
      

    
    <cds-menu-item label="First action">
    
      
    
    
  </cds-menu-item>

    
    <cds-menu-item label="Second action">
    
      
    
    
  </cds-menu-item>

    
    <cds-menu-item disabled label="Third action">
    
      
    
    
  </cds-menu-item>


    
  </cds-menu>

  </cds-menu-button>
  ```

  ##### ghost

  ```heex
  <.menu_button label="Menu" size="md" kind="ghost">
    <:item label="Edit" />
    <:item label="Delete" kind="danger" />
  </.menu_button>
  ```

  ```html
  <cds-menu-button kind="ghost" label="Menu" menu-alignment="bottom" menu-background-token="layer" size="md" tab-index="0" id="menu-button-single-ghost">
    
    <cds-menu>
    
      

    
    <cds-menu-item label="Edit">
    
      
    
    
  </cds-menu-item>

    
    <cds-menu-item kind="danger" label="Delete">
    
      
    
    
  </cds-menu-item>


    
  </cds-menu>

  </cds-menu-button>
  ```

  ##### group: sizes

  ```heex
  <.menu_button label="Menu" size="sm">
    <:item label="Item A" />
    <:item label="Item B" />
  </.menu_button>
  <.menu_button label="Menu" size="md">
    <:item label="Item A" />
    <:item label="Item B" />
  </.menu_button>
  <.menu_button label="Menu" size="lg">
    <:item label="Item A" />
    <:item label="Item B" />
  </.menu_button>
  ```

  ```html
  <cds-menu-button kind="primary" label="Menu" menu-alignment="bottom" menu-background-token="layer" size="sm" tab-index="0" id="menu-button-sizes-sm">
    
    <cds-menu>
    
      

    
    <cds-menu-item label="Item A">
    
      
    
    
  </cds-menu-item>

    
    <cds-menu-item label="Item B">
    
      
    
    
  </cds-menu-item>


    
  </cds-menu>

  </cds-menu-button>
  <cds-menu-button kind="primary" label="Menu" menu-alignment="bottom" menu-background-token="layer" size="md" tab-index="0" id="menu-button-sizes-md">
    
    <cds-menu>
    
      

    
    <cds-menu-item label="Item A">
    
      
    
    
  </cds-menu-item>

    
    <cds-menu-item label="Item B">
    
      
    
    
  </cds-menu-item>


    
  </cds-menu>

  </cds-menu-button>
  <cds-menu-button kind="primary" label="Menu" menu-alignment="bottom" menu-background-token="layer" size="lg" tab-index="0" id="menu-button-sizes-lg">
    
    <cds-menu>
    
      

    
    <cds-menu-item label="Item A">
    
      
    
    
  </cds-menu-item>

    
    <cds-menu-item label="Item B">
    
      
    
    
  </cds-menu-item>


    
  </cds-menu>

  </cds-menu-button>
  ```


  ### `modal`

  #### basic

  ##### example

  ```heex
  <div style="display: grid; gap: 1rem;">
        <div style="display: flex; flex-wrap: wrap; gap: 0.75rem;">
          <.button kind="primary" phx-click="open_modal" phx-value-id="small">
            Open small modal
          </.button>
          <.button kind="secondary" phx-click="open_modal" phx-value-id="large">
            Open large modal
          </.button>
          <.button kind="danger--tertiary" phx-click="open_modal" phx-value-id="danger">
            Open danger modal
          </.button>
        </div>

        <.modal open={@open_modal == "small"} size="sm">
          <:label>Optional label</:label>
          <:heading>Modal heading</:heading>
          <:body>Add your modal content here. Use descriptive text to explain next steps.</:body>
          <:footer_button kind="secondary" attrs={%{"phx-click" => "close_modal"}}>Cancel</:footer_button>
          <:footer_button kind="primary" attrs={%{"phx-click" => "close_modal"}}>Submit</:footer_button>
        </.modal>

        <.modal open={@open_modal == "large"} size="lg">
          <:label>Large modal</:label>
          <:heading>Modal heading</:heading>
          <:body>Large modal content with additional context.</:body>
          <:footer_button kind="secondary" attrs={%{"phx-click" => "close_modal"}}>Back</:footer_button>
          <:footer_button kind="primary" attrs={%{"phx-click" => "close_modal"}}>Continue</:footer_button>
        </.modal>

        <.modal open={@open_modal == "danger"} size="sm">
          <:label>Danger</:label>
          <:heading>Delete item</:heading>
          <:body>Are you sure you want to delete this item?</:body>
          <:footer_button kind="secondary" attrs={%{"phx-click" => "close_modal"}}>Cancel</:footer_button>
          <:footer_button kind="danger" attrs={%{"phx-click" => "close_modal"}}>Delete</:footer_button>
        </.modal>
      </div>
  ```

  ```html
  <div style="display: grid; gap: 1rem;">
    <div style="display: flex; flex-wrap: wrap; gap: 0.75rem;">
      <cds-button kind="primary" link-role="button" size="lg" tab-index="0" tooltip-alignment="" tooltip-position="top" type="button" phx-click="open_modal" phx-value-id="small">
    
        Open small modal
      
    
  </cds-button>
      <cds-button kind="secondary" link-role="button" size="lg" tab-index="0" tooltip-alignment="" tooltip-position="top" type="button" phx-click="open_modal" phx-value-id="large">
    
        Open large modal
      
    
  </cds-button>
      <cds-button kind="danger--tertiary" link-role="button" size="lg" tab-index="0" tooltip-alignment="" tooltip-position="top" type="button" phx-click="open_modal" phx-value-id="danger">
    
        Open danger modal
      
    
  </cds-button>
    </div>

    <cds-modal loading-icon-description="Loading" loading-success-delay="1500" size="sm">
    
    <cds-modal-header>
    
      
        <cds-modal-label>
    Optional label
  </cds-modal-label>
      
      
        <cds-modal-heading>
    Modal heading
  </cds-modal-heading>
      
    
  </cds-modal-header>
    <cds-modal-body>
    
      <cds-modal-body-content>
    
        
          Add your modal content here. Use descriptive text to explain next steps.
        
      
  </cds-modal-body-content>
    
  </cds-modal-body>
    <cds-modal-footer>
    
      
        <cds-modal-footer-button kind="secondary" link-role="button" size="lg" tab-index="0" tooltip-alignment="" tooltip-position="top" phx-click="close_modal">
    
          Cancel
        
  </cds-modal-footer-button>
      
        <cds-modal-footer-button kind="primary" link-role="button" size="lg" tab-index="0" tooltip-alignment="" tooltip-position="top" phx-click="close_modal">
    
          Submit
        
  </cds-modal-footer-button>
      
    
  </cds-modal-footer>
    
      

  </cds-modal>

    <cds-modal loading-icon-description="Loading" loading-success-delay="1500" size="lg">
    
    <cds-modal-header>
    
      
        <cds-modal-label>
    Large modal
  </cds-modal-label>
      
      
        <cds-modal-heading>
    Modal heading
  </cds-modal-heading>
      
    
  </cds-modal-header>
    <cds-modal-body>
    
      <cds-modal-body-content>
    
        
          Large modal content with additional context.
        
      
  </cds-modal-body-content>
    
  </cds-modal-body>
    <cds-modal-footer>
    
      
        <cds-modal-footer-button kind="secondary" link-role="button" size="lg" tab-index="0" tooltip-alignment="" tooltip-position="top" phx-click="close_modal">
    
          Back
        
  </cds-modal-footer-button>
      
        <cds-modal-footer-button kind="primary" link-role="button" size="lg" tab-index="0" tooltip-alignment="" tooltip-position="top" phx-click="close_modal">
    
          Continue
        
  </cds-modal-footer-button>
      
    
  </cds-modal-footer>
    
      

  </cds-modal>

    <cds-modal loading-icon-description="Loading" loading-success-delay="1500" size="sm">
    
    <cds-modal-header>
    
      
        <cds-modal-label>
    Danger
  </cds-modal-label>
      
      
        <cds-modal-heading>
    Delete item
  </cds-modal-heading>
      
    
  </cds-modal-header>
    <cds-modal-body>
    
      <cds-modal-body-content>
    
        
          Are you sure you want to delete this item?
        
      
  </cds-modal-body-content>
    
  </cds-modal-body>
    <cds-modal-footer>
    
      
        <cds-modal-footer-button kind="secondary" link-role="button" size="lg" tab-index="0" tooltip-alignment="" tooltip-position="top" phx-click="close_modal">
    
          Cancel
        
  </cds-modal-footer-button>
      
        <cds-modal-footer-button kind="danger" link-role="button" size="lg" tab-index="0" tooltip-alignment="" tooltip-position="top" phx-click="close_modal">
    
          Delete
        
  </cds-modal-footer-button>
      
    
  </cds-modal-footer>
    
      

  </cds-modal>
  </div>
  ```


  ### `multi_select`

  #### basic

  ##### default

  ```heex
  <.multi_select name="multi-select-default" style="min-width: 20rem;">
    <:title_text>Choose multiple</:title_text>
    <:item value="one">Option 1</:item>
    <:item value="two">Option 2</:item>
    <:item value="three">Option 3</:item>
  </.multi_select>
  ```

  ```html
  <input type="hidden" id="multi-select-default-input" name="multi-select-default" value="">
  <cds-multi-select clear-selection-description="Total items selected: " clear-selection-text="To clear selection, press Delete or Backspace." direction="bottom" locale="en" name="multi-select-default" required-validity-message="Please fill out this field." selection-feedback="top-after-reopen" size="md" type="" id="basic-single-default" style="min-width: 20rem;" data-form-detail="checked" data-form-event="cds-multi-select-selected" data-form-input="multi-select-default-input" data-form-mode="value" phx-hook="Graphene.FormComponents.GrapheneFormBridge">
    
    
    <div slot="title-text">
      Choose multiple
    </div>
    
      <cds-multi-select-item size="md" value="one">
    
        Option 1
      
  </cds-multi-select-item>
    
      <cds-multi-select-item size="md" value="two">
    
        Option 2
      
  </cds-multi-select-item>
    
      <cds-multi-select-item size="md" value="three">
    
        Option 3
      
  </cds-multi-select-item>
    

    
    

    
  </cds-multi-select>
  ```

  ##### inline

  ```heex
  <.multi_select name="multi-select-inline" type="inline" style="min-width: 20rem;">
    <:title_text>Inline</:title_text>
    <:item value="alpha">Alpha</:item>
    <:item value="beta">Beta</:item>
  </.multi_select>
  ```

  ```html
  <input type="hidden" id="multi-select-inline-input" name="multi-select-inline" value="">
  <cds-multi-select clear-selection-description="Total items selected: " clear-selection-text="To clear selection, press Delete or Backspace." direction="bottom" locale="en" name="multi-select-inline" required-validity-message="Please fill out this field." selection-feedback="top-after-reopen" size="md" type="inline" id="basic-single-inline" style="min-width: 20rem;" data-form-detail="checked" data-form-event="cds-multi-select-selected" data-form-input="multi-select-inline-input" data-form-mode="value" phx-hook="Graphene.FormComponents.GrapheneFormBridge">
    
    
    <div slot="title-text">
      Inline
    </div>
    
      <cds-multi-select-item size="md" value="alpha">
    
        Alpha
      
  </cds-multi-select-item>
    
      <cds-multi-select-item size="md" value="beta">
    
        Beta
      
  </cds-multi-select-item>
    

    
    

    
  </cds-multi-select>
  ```

  ##### disabled

  ```heex
  <.multi_select disabled name="multi-select-disabled" style="min-width: 20rem;">
    <:title_text>Disabled</:title_text>
    <:item value="one">Option 1</:item>
    <:item value="two">Option 2</:item>
  </.multi_select>
  ```

  ```html
  <input type="hidden" id="multi-select-disabled-input" name="multi-select-disabled" value="">
  <cds-multi-select clear-selection-description="Total items selected: " clear-selection-text="To clear selection, press Delete or Backspace." direction="bottom" disabled locale="en" name="multi-select-disabled" required-validity-message="Please fill out this field." selection-feedback="top-after-reopen" size="md" type="" id="basic-single-disabled" style="min-width: 20rem;" data-form-detail="checked" data-form-event="cds-multi-select-selected" data-form-input="multi-select-disabled-input" data-form-mode="value" phx-hook="Graphene.FormComponents.GrapheneFormBridge">
    
    
    <div slot="title-text">
      Disabled
    </div>
    
      <cds-multi-select-item size="md" value="one">
    
        Option 1
      
  </cds-multi-select-item>
    
      <cds-multi-select-item size="md" value="two">
    
        Option 2
      
  </cds-multi-select-item>
    

    
    

    
  </cds-multi-select>
  ```


  ### `number_input`

  #### basic

  ##### default

  ```heex
  <.number_input name="number-input-default" value="10">
    <:label_text>Quantity</:label_text>
  </.number_input>
  ```

  ```html
  <input type="hidden" id="number-input-default-input" name="number-input-default" value="10">
  <cds-number-input decrement-button-assistive-text="decrease number input" default-value="10" hidePasswordLabel="Hide password" increment-button-assistive-text="increase number input" max="Infty" min="-Infty" name="number-input-default" required-validity-message="Please fill out this field." showPasswordLabel="Show password" size="md" step="1" tooltipAlignment="center" tooltipDirection="bottom" type="text" id="basic-single-default" data-form-detail="checked" data-form-event="cds-number-input" data-form-input="number-input-default-input" data-form-mode="value" phx-hook="Graphene.FormComponents.GrapheneFormBridge">
    
    
    
    <div slot="label-text">
      Quantity
    </div>
    
  </cds-number-input>
  ```

  ##### helper_text

  ```heex
  <.number_input name="number-input-helper" value="2">
    <:label_text>Seats</:label_text>
    <:helper_text>Available seats</:helper_text>
  </.number_input>
  ```

  ```html
  <input type="hidden" id="number-input-helper-input" name="number-input-helper" value="2">
  <cds-number-input decrement-button-assistive-text="decrease number input" default-value="2" hidePasswordLabel="Hide password" increment-button-assistive-text="increase number input" max="Infty" min="-Infty" name="number-input-helper" required-validity-message="Please fill out this field." showPasswordLabel="Show password" size="md" step="1" tooltipAlignment="center" tooltipDirection="bottom" type="text" id="basic-single-helper-text" data-form-detail="checked" data-form-event="cds-number-input" data-form-input="number-input-helper-input" data-form-mode="value" phx-hook="Graphene.FormComponents.GrapheneFormBridge">
    
    
    <div slot="helper-text">
      Available seats
    </div>
    <div slot="label-text">
      Seats
    </div>
    
  </cds-number-input>
  ```

  ##### invalid

  ```heex
  <.number_input invalid name="number-input-invalid" value="0" invalid_text="Minimum is 1">
    <:label_text>Licenses</:label_text>
  </.number_input>
  ```

  ```html
  <input type="hidden" id="number-input-invalid-input" name="number-input-invalid" value="0">
  <cds-number-input decrement-button-assistive-text="decrease number input" default-value="0" hidePasswordLabel="Hide password" increment-button-assistive-text="increase number input" invalid invalid-text="Minimum is 1" max="Infty" min="-Infty" name="number-input-invalid" required-validity-message="Please fill out this field." showPasswordLabel="Show password" size="md" step="1" tooltipAlignment="center" tooltipDirection="bottom" type="text" id="basic-single-invalid" data-form-detail="checked" data-form-event="cds-number-input" data-form-input="number-input-invalid-input" data-form-mode="value" phx-hook="Graphene.FormComponents.GrapheneFormBridge">
    
    
    
    <div slot="label-text">
      Licenses
    </div>
    
  </cds-number-input>
  ```


  ### `ordered_list`

  #### list/ordered

  ##### default

  ```heex
  <.ordered_list >
    <:item>First item</:item>
    <:item>Second item</:item>
    <:item>Third item</:item>
  </.ordered_list>
  ```

  ```html
  <cds-ordered-list id="ordered-single-default">
    
    
      <cds-list-item>
    
        First item
      
    
  </cds-list-item>
    
      <cds-list-item>
    
        Second item
      
    
  </cds-list-item>
    
      <cds-list-item>
    
        Third item
      
    
  </cds-list-item>
    
    
    

  </cds-ordered-list>
  ```

  ##### native

  ```heex
  <.ordered_list native>
    <:item>Step one</:item>
    <:item>Step two</:item>
  </.ordered_list>
  ```

  ```html
  <cds-ordered-list native id="ordered-single-native">
    
    
      <cds-list-item>
    
        Step one
      
    
  </cds-list-item>
    
      <cds-list-item>
    
        Step two
      
    
  </cds-list-item>
    
    
    

  </cds-ordered-list>
  ```

  ##### expressive

  ```heex
  <.ordered_list is_expressive>
    <:item>Expressive one</:item>
    <:item>Expressive two</:item>
  </.ordered_list>
  ```

  ```html
  <cds-ordered-list is-expressive id="ordered-single-expressive">
    
    
      <cds-list-item>
    
        Expressive one
      
    
  </cds-list-item>
    
      <cds-list-item>
    
        Expressive two
      
    
  </cds-list-item>
    
    
    

  </cds-ordered-list>
  ```


  ### `overflow_menu`

  #### basic

  ##### default

  ```heex
  <.overflow_menu >
    <:icon>
      <Graphene.Icons.icon fit="width" name="overflow-menu--horizontal" />
    </:icon>
    <:tooltip_content>Options</:tooltip_content>
    <:item>Action 1</:item>
    <:item>Action 2</:item>
    <:item danger>Delete</:item>
  </.overflow_menu>
  ```

  ```html
  <cds-overflow-menu align="top" close-on-activation enter-delay-ms="100" index="1" kind="primary" leave-delay-ms="300" link-role="button" size="md" tab-index="0" tooltip-alignment="" tooltip-position="top" type="button" id="basic-single-default">
    
    <span slot="icon">
      
    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" width="auto" fill="currentColor" preserveAspectRatio="xMidYMid meet" aria-hidden>
    
    
    <circle cx="8" cy="16" r="2"/><circle cx="16" cy="16" r="2"/><circle cx="24" cy="16" r="2"/>

  </svg>

    </span>
    <span slot="tooltip-content">
      Options
    </span>
    <cds-overflow-menu-body direction="bottom" size="md">
    
      
        <cds-overflow-menu-item size="md">
    
          Action 1
        
  </cds-overflow-menu-item>
      
        <cds-overflow-menu-item size="md">
    
          Action 2
        
  </cds-overflow-menu-item>
      
        <cds-overflow-menu-item danger size="md">
    
          Delete
        
  </cds-overflow-menu-item>
      
    
  </cds-overflow-menu-body>

    
    
  </cds-overflow-menu>
  ```

  ##### autoalign

  ```heex
  <.overflow_menu autoalign>
    <:icon>
      <Graphene.Icons.icon fit="width" name="overflow-menu--horizontal" />
    </:icon>
    <:tooltip_content>Auto align</:tooltip_content>
    <:item>Edit</:item>
    <:item>Duplicate</:item>
  </.overflow_menu>
  ```

  ```html
  <cds-overflow-menu align="top" autoalign close-on-activation enter-delay-ms="100" index="1" kind="primary" leave-delay-ms="300" link-role="button" size="md" tab-index="0" tooltip-alignment="" tooltip-position="top" type="button" id="basic-single-autoalign">
    
    <span slot="icon">
      
    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" width="auto" fill="currentColor" preserveAspectRatio="xMidYMid meet" aria-hidden>
    
    
    <circle cx="8" cy="16" r="2"/><circle cx="16" cy="16" r="2"/><circle cx="24" cy="16" r="2"/>

  </svg>

    </span>
    <span slot="tooltip-content">
      Auto align
    </span>
    <cds-overflow-menu-body direction="bottom" size="md">
    
      
        <cds-overflow-menu-item size="md">
    
          Edit
        
  </cds-overflow-menu-item>
      
        <cds-overflow-menu-item size="md">
    
          Duplicate
        
  </cds-overflow-menu-item>
      
    
  </cds-overflow-menu-body>

    
    
  </cds-overflow-menu>
  ```

  ##### disabled

  ```heex
  <.overflow_menu disabled>
    <:icon>
      <Graphene.Icons.icon fit="width" name="overflow-menu--horizontal" />
    </:icon>
    <:tooltip_content>Disabled</:tooltip_content>
    <:item>Action 1</:item>
  </.overflow_menu>
  ```

  ```html
  <cds-overflow-menu align="top" close-on-activation disabled enter-delay-ms="100" index="1" kind="primary" leave-delay-ms="300" link-role="button" size="md" tab-index="0" tooltip-alignment="" tooltip-position="top" type="button" id="basic-single-disabled">
    
    <span slot="icon">
      
    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" width="auto" fill="currentColor" preserveAspectRatio="xMidYMid meet" aria-hidden>
    
    
    <circle cx="8" cy="16" r="2"/><circle cx="16" cy="16" r="2"/><circle cx="24" cy="16" r="2"/>

  </svg>

    </span>
    <span slot="tooltip-content">
      Disabled
    </span>
    <cds-overflow-menu-body direction="bottom" size="md">
    
      
        <cds-overflow-menu-item size="md">
    
          Action 1
        
  </cds-overflow-menu-item>
      
    
  </cds-overflow-menu-body>

    
    
  </cds-overflow-menu>
  ```


  ### `page_header`

  ##### default

  ```heex
  <.page_header >
    <:breadcrumb_slot>
      <Graphene.CarbonComponents.breadcrumb>
        <:item href="#">Home</:item>
        <:item current>Page</:item>
      </Graphene.CarbonComponents.breadcrumb>
    </:breadcrumb_slot>
    <:content title="Page title" />
    <:content_text subtitle="Optional subtitle">
      This is a short supporting description for the page header.
    </:content_text>
  </.page_header>
  ```

  ```html
  <cds-page-header id="page-header-single-default">
    
    
    
      <cds-page-header-breadcrumb border>
    
        
          
    <cds-breadcrumb size="md">
    
    
      <cds-breadcrumb-item>
    
        
          <cds-breadcrumb-link href="#" size="MEDIUM">
    
            Home
          
  </cds-breadcrumb-link>
        
      
  </cds-breadcrumb-item>
    
      <cds-breadcrumb-item>
    
        
          Page
        
      
  </cds-breadcrumb-item>
    

  </cds-breadcrumb>

        
      
    
    
  </cds-page-header-breadcrumb>
    
    
      <cds-page-header-content title="Page title">
    
        
          
            <cds-page-header-content-text subtitle="Optional subtitle">
    
              
                
    This is a short supporting description for the page header.

              
            
  </cds-page-header-content-text>
          
        
        
      
    
    
  </cds-page-header-content>
    
    
    

  </cds-page-header>
  ```

  ##### with_actions

  ```heex
  <.page_header >
    <:breadcrumb_slot>
      <Graphene.CarbonComponents.breadcrumb>
        <:item href="#">Home</:item>
        <:item href="#">Workspace</:item>
        <:item current>Projects</:item>
      </Graphene.CarbonComponents.breadcrumb>
    </:breadcrumb_slot>
    <:content title="Projects">
      <Graphene.CarbonComponents.button kind="ghost">New project</Graphene.CarbonComponents.button>
    </:content>
    <:content_text subtitle="Team projects">
      Manage shared initiatives for your team.
    </:content_text>
  </.page_header>
  ```

  ```html
  <cds-page-header id="page-header-single-with-actions">
    
    
    
      <cds-page-header-breadcrumb border>
    
        
          
    <cds-breadcrumb size="md">
    
    
      <cds-breadcrumb-item>
    
        
          <cds-breadcrumb-link href="#" size="MEDIUM">
    
            Home
          
  </cds-breadcrumb-link>
        
      
  </cds-breadcrumb-item>
    
      <cds-breadcrumb-item>
    
        
          <cds-breadcrumb-link href="#" size="MEDIUM">
    
            Workspace
          
  </cds-breadcrumb-link>
        
      
  </cds-breadcrumb-item>
    
      <cds-breadcrumb-item>
    
        
          Projects
        
      
  </cds-breadcrumb-item>
    

  </cds-breadcrumb>

        
      
    
    
  </cds-page-header-breadcrumb>
    
    
      <cds-page-header-content title="Projects">
    
        
          
            <cds-page-header-content-text subtitle="Team projects">
    
              
                
    Manage shared initiatives for your team.

              
            
  </cds-page-header-content-text>
          
        
        
          
    <cds-button kind="ghost" link-role="button" size="lg" tab-index="0" tooltip-alignment="" tooltip-position="top" type="button">
    New project
    
  </cds-button>

        
      
    
    
  </cds-page-header-content>
    
    
    

  </cds-page-header>
  ```

  ##### compact

  ```heex
  <.page_header >
    <:breadcrumb_slot border={false}>
      <Graphene.CarbonComponents.breadcrumb>
        <:item href="#">Home</:item>
        <:item current>Settings</:item>
      </Graphene.CarbonComponents.breadcrumb>
    </:breadcrumb_slot>
    <:content title="Settings" />
    <:content_text subtitle="Account">
      Update profile and security preferences.
    </:content_text>
  </.page_header>
  ```

  ```html
  <cds-page-header id="page-header-single-compact">
    
    
    
      <cds-page-header-breadcrumb>
    
        
          
    <cds-breadcrumb size="md">
    
    
      <cds-breadcrumb-item>
    
        
          <cds-breadcrumb-link href="#" size="MEDIUM">
    
            Home
          
  </cds-breadcrumb-link>
        
      
  </cds-breadcrumb-item>
    
      <cds-breadcrumb-item>
    
        
          Settings
        
      
  </cds-breadcrumb-item>
    

  </cds-breadcrumb>

        
      
    
    
  </cds-page-header-breadcrumb>
    
    
      <cds-page-header-content title="Settings">
    
        
          
            <cds-page-header-content-text subtitle="Account">
    
              
                
    Update profile and security preferences.

              
            
  </cds-page-header-content-text>
          
        
        
      
    
    
  </cds-page-header-content>
    
    
    

  </cds-page-header>
  ```


  ### `pagination`

  #### basic

  ##### default

  ```heex
  <.pagination page_size="10" total_items="105"/>
  ```

  ```html
  <cds-pagination backward-text="Previous page" forward-text="Next page" items-per-page-text="Items per page:" page="1" page-size="10" size="md" start="0" total-items="105" totalPages="1" id="basic-single-default">
    
    
  </cds-pagination>
  ```

  ##### small

  ```heex
  <.pagination size="sm" page_size="5" total_items="42"/>
  ```

  ```html
  <cds-pagination backward-text="Previous page" forward-text="Next page" items-per-page-text="Items per page:" page="1" page-size="5" size="sm" start="0" total-items="42" totalPages="1" id="basic-single-small">
    
    
  </cds-pagination>
  ```

  ##### unknown

  ```heex
  <.pagination page_size="10" pages_unknown total_items=""/>
  ```

  ```html
  <cds-pagination backward-text="Previous page" forward-text="Next page" items-per-page-text="Items per page:" page="1" page-size="10" pages-unknown size="md" start="0" total-items="" totalPages="1" id="basic-single-unknown">
    
    
  </cds-pagination>
  ```


  ### `password_input`

  #### basic

  ##### default

  ```heex
  <.password_input name="password-input-default">
    <:label_text>Password</:label_text>
  </.password_input>
  ```

  ```html
  <input type="hidden" id="password-input-default-input" name="password-input-default" value="">
  <cds-password-input hide-password-label="Hide password" name="password-input-default" required-validity-message="Please fill out this field." show-password-label="Show password" size="md" tooltip-alignment="center" tooltip-position="bottom" type="password" id="basic-single-default" data-form-detail="checked" data-form-event="input" data-form-input="password-input-default-input" data-form-mode="value" phx-hook="Graphene.FormComponents.GrapheneFormBridge">
    
    
    
    <div slot="label-text">
      Password
    </div>
    
  </cds-password-input>
  ```

  ##### helper_text

  ```heex
  <.password_input name="password-input-helper">
    <:label_text>New password</:label_text>
    <:helper_text>Minimum 8 characters</:helper_text>
  </.password_input>
  ```

  ```html
  <input type="hidden" id="password-input-helper-input" name="password-input-helper" value="">
  <cds-password-input hide-password-label="Hide password" name="password-input-helper" required-validity-message="Please fill out this field." show-password-label="Show password" size="md" tooltip-alignment="center" tooltip-position="bottom" type="password" id="basic-single-helper-text" data-form-detail="checked" data-form-event="input" data-form-input="password-input-helper-input" data-form-mode="value" phx-hook="Graphene.FormComponents.GrapheneFormBridge">
    
    
    <div slot="helper-text">
      Minimum 8 characters
    </div>
    <div slot="label-text">
      New password
    </div>
    
  </cds-password-input>
  ```

  ##### invalid

  ```heex
  <.password_input invalid name="password-input-invalid" invalid_text="Required">
    <:label_text>Password</:label_text>
  </.password_input>
  ```

  ```html
  <input type="hidden" id="password-input-invalid-input" name="password-input-invalid" value="">
  <cds-password-input hide-password-label="Hide password" invalid invalid-text="Required" name="password-input-invalid" required-validity-message="Please fill out this field." show-password-label="Show password" size="md" tooltip-alignment="center" tooltip-position="bottom" type="password" id="basic-single-invalid" data-form-detail="checked" data-form-event="input" data-form-input="password-input-invalid-input" data-form-mode="value" phx-hook="Graphene.FormComponents.GrapheneFormBridge">
    
    
    
    <div slot="label-text">
      Password
    </div>
    
  </cds-password-input>
  ```


  ### `popover`

  #### autoalign

  ##### default

  ```heex
  <.popover autoalign alignment_axis_offset="8">
    <:trigger>
      <Graphene.CarbonComponents.button kind="secondary">Auto align popover</Graphene.CarbonComponents.button>
    </:trigger>
    <:content>
      <p>Auto-aligned popover content.</p>
    </:content>
  </.popover>
  ```

  ```html
  <cds-popover alignment-axis-offset="8" autoalign backgroundToken="layer" caret dropShadow id="auto-align-single-default">
    
    
      
    <cds-button kind="secondary" link-role="button" size="lg" tab-index="0" tooltip-alignment="" tooltip-position="top" type="button">
    Auto align popover
    
  </cds-button>

    
    
      <cds-popover-content backgroundToken="layer" dropShadow slot="content">
    
        
    <p>Auto-aligned popover content.</p>

      
  </cds-popover-content>
    
    
    

  </cds-popover>
  ```

  ##### offset_16

  ```heex
  <.popover autoalign alignment_axis_offset="16">
    <:trigger>
      <Graphene.CarbonComponents.button kind="secondary">Offset 16</Graphene.CarbonComponents.button>
    </:trigger>
    <:content>
      <p>Offset axis example.</p>
    </:content>
  </.popover>
  ```

  ```html
  <cds-popover alignment-axis-offset="16" autoalign backgroundToken="layer" caret dropShadow id="auto-align-single-offset-16">
    
    
      
    <cds-button kind="secondary" link-role="button" size="lg" tab-index="0" tooltip-alignment="" tooltip-position="top" type="button">
    Offset 16
    
  </cds-button>

    
    
      <cds-popover-content backgroundToken="layer" dropShadow slot="content">
    
        
    <p>Offset axis example.</p>

      
  </cds-popover-content>
    
    
    

  </cds-popover>
  ```

  ##### with_caret

  ```heex
  <.popover autoalign border caret>
    <:trigger>
      <Graphene.CarbonComponents.button kind="secondary">Caret popover</Graphene.CarbonComponents.button>
    </:trigger>
    <:content>
      <p>Auto align with caret.</p>
    </:content>
  </.popover>
  ```

  ```html
  <cds-popover autoalign backgroundToken="layer" border caret dropShadow id="auto-align-single-with-caret">
    
    
      
    <cds-button kind="secondary" link-role="button" size="lg" tab-index="0" tooltip-alignment="" tooltip-position="top" type="button">
    Caret popover
    
  </cds-button>

    
    
      <cds-popover-content backgroundToken="layer" dropShadow slot="content">
    
        
    <p>Auto align with caret.</p>

      
  </cds-popover-content>
    
    
    

  </cds-popover>
  ```


  #### basic

  ##### bottom

  ```heex
  <.popover align="bottom">
    <:trigger>
      <Graphene.CarbonComponents.button kind="secondary">Open popover</Graphene.CarbonComponents.button>
    </:trigger>
    <:content>
      <p>Popover content goes here.</p>
    </:content>
  </.popover>
  ```

  ```html
  <cds-popover align="bottom" backgroundToken="layer" caret dropShadow id="basic-single-bottom">
    
    
      
    <cds-button kind="secondary" link-role="button" size="lg" tab-index="0" tooltip-alignment="" tooltip-position="top" type="button">
    Open popover
    
  </cds-button>

    
    
      <cds-popover-content backgroundToken="layer" dropShadow slot="content">
    
        
    <p>Popover content goes here.</p>

      
  </cds-popover-content>
    
    
    

  </cds-popover>
  ```

  ##### top

  ```heex
  <.popover align="top">
    <:trigger>
      <Graphene.CarbonComponents.button kind="secondary">Top popover</Graphene.CarbonComponents.button>
    </:trigger>
    <:content>
      <p>Top aligned content.</p>
    </:content>
  </.popover>
  ```

  ```html
  <cds-popover align="top" backgroundToken="layer" caret dropShadow id="basic-single-top">
    
    
      
    <cds-button kind="secondary" link-role="button" size="lg" tab-index="0" tooltip-alignment="" tooltip-position="top" type="button">
    Top popover
    
  </cds-button>

    
    
      <cds-popover-content backgroundToken="layer" dropShadow slot="content">
    
        
    <p>Top aligned content.</p>

      
  </cds-popover-content>
    
    
    

  </cds-popover>
  ```

  ##### right

  ```heex
  <.popover align="right">
    <:trigger>
      <Graphene.CarbonComponents.button kind="secondary">Right popover</Graphene.CarbonComponents.button>
    </:trigger>
    <:content>
      <p>Right aligned content.</p>
    </:content>
  </.popover>
  ```

  ```html
  <cds-popover align="right" backgroundToken="layer" caret dropShadow id="basic-single-right">
    
    
      
    <cds-button kind="secondary" link-role="button" size="lg" tab-index="0" tooltip-alignment="" tooltip-position="top" type="button">
    Right popover
    
  </cds-button>

    
    
      <cds-popover-content backgroundToken="layer" dropShadow slot="content">
    
        
    <p>Right aligned content.</p>

      
  </cds-popover-content>
    
    
    

  </cds-popover>
  ```


  ### `progress_bar`

  ##### quarter

  ```heex
  <.progress_bar max="100" value="25"/>
  ```

  ```html
  <cds-progress-bar max="100" size="big" status="active" type="default" value="25" id="progress-bar-single-quarter">
    
  </cds-progress-bar>
  ```

  ##### half

  ```heex
  <.progress_bar max="100" value="50"/>
  ```

  ```html
  <cds-progress-bar max="100" size="big" status="active" type="default" value="50" id="progress-bar-single-half">
    
  </cds-progress-bar>
  ```

  ##### complete

  ```heex
  <.progress_bar max="100" value="100"/>
  ```

  ```html
  <cds-progress-bar max="100" size="big" status="active" type="default" value="100" id="progress-bar-single-complete">
    
  </cds-progress-bar>
  ```


  ### `progress_indicator`

  #### basic

  ##### default

  ```heex
  <.progress_indicator current_index="1">
    <:step label="First" complete />
    <:step label="Second" current />
    <:step label="Third" />
  </.progress_indicator>
  ```

  ```html
  <cds-progress-indicator current-index="1" id="basic-single-default">
    
    
      <cds-progress-step complete label="First" state="incomplete">
    
        
      
    
  </cds-progress-step>
    
      <cds-progress-step current label="Second" state="incomplete">
    
        
      
    
  </cds-progress-step>
    
      <cds-progress-step label="Third" state="incomplete">
    
        
      
    
  </cds-progress-step>
    

  </cds-progress-indicator>
  ```

  ##### vertical

  ```heex
  <.progress_indicator vertical current_index="2">
    <:step label="Plan" complete />
    <:step label="Build" complete />
    <:step label="Launch" current />
    <:step label="Iterate" />
  </.progress_indicator>
  ```

  ```html
  <cds-progress-indicator current-index="2" vertical id="basic-single-vertical">
    
    
      <cds-progress-step complete label="Plan" state="incomplete">
    
        
      
    
  </cds-progress-step>
    
      <cds-progress-step complete label="Build" state="incomplete">
    
        
      
    
  </cds-progress-step>
    
      <cds-progress-step current label="Launch" state="incomplete">
    
        
      
    
  </cds-progress-step>
    
      <cds-progress-step label="Iterate" state="incomplete">
    
        
      
    
  </cds-progress-step>
    

  </cds-progress-indicator>
  ```

  ##### spaced

  ```heex
  <.progress_indicator space_equally current_index="0">
    <:step label="Step one" current />
    <:step label="Step two" />
    <:step label="Step three" />
  </.progress_indicator>
  ```

  ```html
  <cds-progress-indicator current-index="0" space-equally id="basic-single-spaced">
    
    
      <cds-progress-step current label="Step one" state="incomplete">
    
        
      
    
  </cds-progress-step>
    
      <cds-progress-step label="Step two" state="incomplete">
    
        
      
    
  </cds-progress-step>
    
      <cds-progress-step label="Step three" state="incomplete">
    
        
      
    
  </cds-progress-step>
    

  </cds-progress-indicator>
  ```


  ### `radio_button_group`

  #### radio_button/basic

  ##### default

  ```heex
  <.radio_button_group name="choices" legend_text="Choose one">
    <:item value="a" label="Option A" />
    <:item value="b" label="Option B" />
  </.radio_button_group>
  ```

  ```html
  <input type="hidden" id="choices-input" name="choices" value="">
  <cds-radio-button-group label-position="right" legend-text="Choose one" name="choices" orientation="horizontal" id="basic-single-default" data-form-detail="checked" data-form-event="cds-radio-button-group-changed" data-form-input="choices-input" data-form-mode="value" phx-hook="Graphene.FormComponents.GrapheneFormBridge">
    
    
      <cds-radio-button label-position="right" label-text="Option A" orientation="horizontal" value="a">
    
    
  </cds-radio-button>
    
      <cds-radio-button label-position="right" label-text="Option B" orientation="horizontal" value="b">
    
    
  </cds-radio-button>
    

  </cds-radio-button-group>
  ```

  ##### disabled

  ```heex
  <.radio_button_group disabled name="choices-disabled" legend_text="Disabled">
    <:item value="a" label="Option A" />
    <:item value="b" label="Option B" />
  </.radio_button_group>
  ```

  ```html
  <input type="hidden" id="choices-disabled-input" name="choices-disabled" value="">
  <cds-radio-button-group disabled label-position="right" legend-text="Disabled" name="choices-disabled" orientation="horizontal" id="basic-single-disabled" data-form-detail="checked" data-form-event="cds-radio-button-group-changed" data-form-input="choices-disabled-input" data-form-mode="value" phx-hook="Graphene.FormComponents.GrapheneFormBridge">
    
    
      <cds-radio-button label-position="right" label-text="Option A" orientation="horizontal" value="a">
    
    
  </cds-radio-button>
    
      <cds-radio-button label-position="right" label-text="Option B" orientation="horizontal" value="b">
    
    
  </cds-radio-button>
    

  </cds-radio-button-group>
  ```

  ##### with_helper

  ```heex
  <.radio_button_group name="choices-help" helper_text="Pick a single option" legend_text="Select one">
    <:item value="a" label="Alpha" />
    <:item value="b" label="Beta" />
  </.radio_button_group>
  ```

  ```html
  <input type="hidden" id="choices-help-input" name="choices-help" value="">
  <cds-radio-button-group helper-text="Pick a single option" label-position="right" legend-text="Select one" name="choices-help" orientation="horizontal" id="basic-single-with-helper" data-form-detail="checked" data-form-event="cds-radio-button-group-changed" data-form-input="choices-help-input" data-form-mode="value" phx-hook="Graphene.FormComponents.GrapheneFormBridge">
    
    
      <cds-radio-button label-position="right" label-text="Alpha" orientation="horizontal" value="a">
    
    
  </cds-radio-button>
    
      <cds-radio-button label-position="right" label-text="Beta" orientation="horizontal" value="b">
    
    
  </cds-radio-button>
    

  </cds-radio-button-group>
  ```


  ### `search`

  #### basic

  ##### default

  ```heex
  <.search name="search-default" placeholder="Search" label_text="Search"/>
  ```

  ```html
  <input type="hidden" id="search-default-input" name="search-default" value="">
  <cds-search autocomplete="off" label-text="Search" name="search-default" placeholder="Search" size="md" id="basic-single-default" data-form-detail="checked" data-form-event="cds-search-input" data-form-input="search-default-input" data-form-mode="value" phx-hook="Graphene.FormComponents.GrapheneFormBridge">
    
  </cds-search>
  ```

  ##### expandable

  ```heex
  <.search name="search-expandable" label_text="Search" expandable expanded/>
  ```

  ```html
  <input type="hidden" id="search-expandable-input" name="search-expandable" value="">
  <cds-search autocomplete="off" expandable expanded label-text="Search" name="search-expandable" placeholder="Search" size="md" id="basic-single-expandable" data-form-detail="checked" data-form-event="cds-search-input" data-form-input="search-expandable-input" data-form-mode="value" phx-hook="Graphene.FormComponents.GrapheneFormBridge">
    
  </cds-search>
  ```

  ##### group: sizes

  ```heex
  <.search name="search-sm" size="sm" label_text="Size sm"/>
  <.search name="search-md" size="md" label_text="Size md"/>
  <.search name="search-lg" size="lg" label_text="Size lg"/>
  ```

  ```html
  <input type="hidden" id="search-sm-input" name="search-sm" value="">
  <cds-search autocomplete="off" label-text="Size sm" name="search-sm" placeholder="Search" size="sm" id="basic-sizes-sm" data-form-detail="checked" data-form-event="cds-search-input" data-form-input="search-sm-input" data-form-mode="value" phx-hook="Graphene.FormComponents.GrapheneFormBridge">
    
  </cds-search>

  <input type="hidden" id="search-md-input" name="search-md" value="">
  <cds-search autocomplete="off" label-text="Size md" name="search-md" placeholder="Search" size="md" id="basic-sizes-md" data-form-detail="checked" data-form-event="cds-search-input" data-form-input="search-md-input" data-form-mode="value" phx-hook="Graphene.FormComponents.GrapheneFormBridge">
    
  </cds-search>

  <input type="hidden" id="search-lg-input" name="search-lg" value="">
  <cds-search autocomplete="off" label-text="Size lg" name="search-lg" placeholder="Search" size="lg" id="basic-sizes-lg" data-form-detail="checked" data-form-event="cds-search-input" data-form-input="search-lg-input" data-form-mode="value" phx-hook="Graphene.FormComponents.GrapheneFormBridge">
    
  </cds-search>
  ```


  ### `select`

  #### basic

  ##### default

  ```heex
  <.select id="basic-single-default" name="select-default">
    <:label_text>Select an option</:label_text>
    <:item value="">Choose one</:item>
    <:item value="option-1">Option 1</:item>
    <:item value="option-2">Option 2</:item>
    <:item value="option-3">Option 3</:item>
  </.select>
  ```

  ```html
  <input type="hidden" id="basic-single-default-input" name="select-default" value="">
  <cds-select name="select-default" required-validity-message="Please fill out this field." size="md" id="basic-single-default" data-form-detail="checked" data-form-event="cds-select-selected" data-form-input="basic-single-default-input" data-form-mode="value" phx-hook="Graphene.FormComponents.GrapheneFormBridge">
    
    
    <div slot="label-text">
      Select an option
    </div>
    
    
    
      <cds-select-item value="">
    
        Choose one
      
  </cds-select-item>
    
      <cds-select-item value="option-1">
    
        Option 1
      
  </cds-select-item>
    
      <cds-select-item value="option-2">
    
        Option 2
      
  </cds-select-item>
    
      <cds-select-item value="option-3">
    
        Option 3
      
  </cds-select-item>
    

    
    
    
    

    
    
    
  </cds-select>
  ```

  ##### inline

  ```heex
  <.select id="basic-single-inline" name="select-inline" inline>
    <:label_text>Inline</:label_text>
    <:item value="alpha">Alpha</:item>
    <:item value="beta">Beta</:item>
  </.select>
  ```

  ```html
  <input type="hidden" id="basic-single-inline-input" name="select-inline" value="">
  <cds-select inline name="select-inline" required-validity-message="Please fill out this field." size="md" id="basic-single-inline" data-form-detail="checked" data-form-event="cds-select-selected" data-form-input="basic-single-inline-input" data-form-mode="value" phx-hook="Graphene.FormComponents.GrapheneFormBridge">
    
    
    <div slot="label-text">
      Inline
    </div>
    
    
    
      <cds-select-item value="alpha">
    
        Alpha
      
  </cds-select-item>
    
      <cds-select-item value="beta">
    
        Beta
      
  </cds-select-item>
    

    
    
    
    

    
    
    
  </cds-select>
  ```

  ##### invalid

  ```heex
  <.select
    id="basic-single-invalid"
    invalid
    name="select-invalid"
    invalid_text="Pick a value"
  >
    <:label_text>Required</:label_text>
    <:item value="one">One</:item>
    <:item value="two">Two</:item>
  </.select>
  ```

  ```html
  <input type="hidden" id="basic-single-invalid-input" name="select-invalid" value="">
  <cds-select invalid invalid-text="Pick a value" name="select-invalid" required-validity-message="Please fill out this field." size="md" id="basic-single-invalid" data-form-detail="checked" data-form-event="cds-select-selected" data-form-input="basic-single-invalid-input" data-form-mode="value" phx-hook="Graphene.FormComponents.GrapheneFormBridge">
    
    
    <div slot="label-text">
      Required
    </div>
    
    
    
      <cds-select-item value="one">
    
        One
      
  </cds-select-item>
    
      <cds-select-item value="two">
    
        Two
      
  </cds-select-item>
    

    
    
    
    

    
    
    
  </cds-select>
  ```


  ### `shape_indicator`

  ##### success

  ```heex
  <.shape_indicator label="Success" kind="success"/>
  ```

  ```html
  <cds-shape-indicator kind="success" label="Success" text-size="12" id="shape-indicator-single-success">
    
  </cds-shape-indicator>
  ```

  ##### failed

  ```heex
  <.shape_indicator label="Failed" kind="failed"/>
  ```

  ```html
  <cds-shape-indicator kind="failed" label="Failed" text-size="12" id="shape-indicator-single-failed">
    
  </cds-shape-indicator>
  ```

  ##### warning

  ```heex
  <.shape_indicator label="Warning" kind="warning"/>
  ```

  ```html
  <cds-shape-indicator kind="warning" label="Warning" text-size="12" id="shape-indicator-single-warning">
    
  </cds-shape-indicator>
  ```


  ### `skeleton_icon`

  #### skeleton/icon

  ##### small

  ```heex
  <.skeleton_icon style="width: 16px; height: 16px;"/>
  ```

  ```html
  <cds-skeleton-icon id="icon-single-small" style="width: 16px; height: 16px;">
    
  </cds-skeleton-icon>
  ```

  ##### medium

  ```heex
  <.skeleton_icon style="width: 24px; height: 24px;"/>
  ```

  ```html
  <cds-skeleton-icon id="icon-single-medium" style="width: 24px; height: 24px;">
    
  </cds-skeleton-icon>
  ```

  ##### large

  ```heex
  <.skeleton_icon style="width: 32px; height: 32px;"/>
  ```

  ```html
  <cds-skeleton-icon id="icon-single-large" style="width: 32px; height: 32px;">
    
  </cds-skeleton-icon>
  ```


  ### `skeleton_placeholder`

  #### skeleton/placeholder

  ##### small

  ```heex
  <.skeleton_placeholder style="width: 120px; height: 16px;"/>
  ```

  ```html
  <cds-skeleton-placeholder id="placeholder-single-small" style="width: 120px; height: 16px;">
    
  </cds-skeleton-placeholder>
  ```

  ##### medium

  ```heex
  <.skeleton_placeholder style="width: 200px; height: 24px;"/>
  ```

  ```html
  <cds-skeleton-placeholder id="placeholder-single-medium" style="width: 200px; height: 24px;">
    
  </cds-skeleton-placeholder>
  ```

  ##### large

  ```heex
  <.skeleton_placeholder style="width: 280px; height: 32px;"/>
  ```

  ```html
  <cds-skeleton-placeholder id="placeholder-single-large" style="width: 280px; height: 32px;">
    
  </cds-skeleton-placeholder>
  ```


  ### `skeleton_text`

  #### skeleton/text

  ##### single

  ```heex
  <.skeleton_text width="60%"/>
  ```

  ```html
  <cds-skeleton-text lineCount="3" type="" width="60%" id="text-single-single">
    
  </cds-skeleton-text>
  ```

  ##### paragraph

  ```heex
  <.skeleton_text paragraph line_count="4"/>
  ```

  ```html
  <cds-skeleton-text lineCount="4" paragraph type="" width="100%" id="text-single-paragraph">
    
  </cds-skeleton-text>
  ```

  ##### heading

  ```heex
  <.skeleton_text width="40%" heading/>
  ```

  ```html
  <cds-skeleton-text heading lineCount="3" type="" width="40%" id="text-single-heading">
    
  </cds-skeleton-text>
  ```


  ### `slider`

  #### basic

  ##### default

  ```heex
  <.slider max="100" min="0" name="slider-default" value="50">
    <:label_text>Slider</:label_text>
  </.slider>
  ```

  ```html
  <input type="hidden" id="slider-default-input" name="slider-default" value="50">
  <cds-slider max="100" min="0" name="slider-default" step-multiplier="4" value="50" id="basic-single-default" data-form-detail="checked" data-form-event="cds-slider-changed" data-form-input="slider-default-input" data-form-mode="value" phx-hook="Graphene.FormComponents.GrapheneFormBridge">
    
    
    <div slot="label-text">
      Slider
    </div>
    
    
    
  </cds-slider>
  ```

  ##### stepped

  ```heex
  <.slider max="10" min="0" name="slider-stepped" value="3" step="1">
    <:label_text>Step</:label_text>
  </.slider>
  ```

  ```html
  <input type="hidden" id="slider-stepped-input" name="slider-stepped" value="3">
  <cds-slider max="10" min="0" name="slider-stepped" step="1" step-multiplier="4" value="3" id="basic-single-stepped" data-form-detail="checked" data-form-event="cds-slider-changed" data-form-input="slider-stepped-input" data-form-mode="value" phx-hook="Graphene.FormComponents.GrapheneFormBridge">
    
    
    <div slot="label-text">
      Step
    </div>
    
    
    
  </cds-slider>
  ```

  ##### disabled

  ```heex
  <.slider disabled max="100" min="0" name="slider-disabled" value="40">
    <:label_text>Disabled</:label_text>
  </.slider>
  ```

  ```html
  <input type="hidden" id="slider-disabled-input" name="slider-disabled" value="40">
  <cds-slider disabled max="100" min="0" name="slider-disabled" step-multiplier="4" value="40" id="basic-single-disabled" data-form-detail="checked" data-form-event="cds-slider-changed" data-form-input="slider-disabled-input" data-form-mode="value" phx-hook="Graphene.FormComponents.GrapheneFormBridge">
    
    
    <div slot="label-text">
      Disabled
    </div>
    
    
    
  </cds-slider>
  ```


  ### `stack`

  ##### horizontal

  ```heex
  <.stack orientation="horizontal" gap="4">
    <Graphene.CarbonComponents.tag type="green">One</Graphene.CarbonComponents.tag>
    <Graphene.CarbonComponents.tag type="blue">Two</Graphene.CarbonComponents.tag>
    <Graphene.CarbonComponents.tag type="red">Three</Graphene.CarbonComponents.tag>
  </.stack>
  ```

  ```html
  <cds-stack gap="4" orientation="horizontal" id="stack-single-horizontal">
    
    <cds-tag open size="md" title="Clear filter" type="green">
    One
  </cds-tag>
  <cds-tag open size="md" title="Clear filter" type="blue">
    Two
  </cds-tag>
  <cds-tag open size="md" title="Clear filter" type="red">
    Three
  </cds-tag>

  </cds-stack>
  ```

  ##### vertical

  ```heex
  <.stack orientation="vertical" gap="3">
    <Graphene.CarbonComponents.tag type="purple">Alpha</Graphene.CarbonComponents.tag>
    <Graphene.CarbonComponents.tag type="cool-gray">Beta</Graphene.CarbonComponents.tag>
  </.stack>
  ```

  ```html
  <cds-stack gap="3" orientation="vertical" id="stack-single-vertical">
    
    <cds-tag open size="md" title="Clear filter" type="purple">
    Alpha
  </cds-tag>
  <cds-tag open size="md" title="Clear filter" type="cool-gray">
    Beta
  </cds-tag>

  </cds-stack>
  ```

  ##### tight

  ```heex
  <.stack orientation="horizontal" gap="2">
    <Graphene.CarbonComponents.tag type="magenta">A</Graphene.CarbonComponents.tag>
    <Graphene.CarbonComponents.tag type="cyan">B</Graphene.CarbonComponents.tag>
    <Graphene.CarbonComponents.tag type="teal">C</Graphene.CarbonComponents.tag>
  </.stack>
  ```

  ```html
  <cds-stack gap="2" orientation="horizontal" id="stack-single-tight">
    
    <cds-tag open size="md" title="Clear filter" type="magenta">
    A
  </cds-tag>
  <cds-tag open size="md" title="Clear filter" type="cyan">
    B
  </cds-tag>
  <cds-tag open size="md" title="Clear filter" type="teal">
    C
  </cds-tag>

  </cds-stack>
  ```


  ### `structured_list`

  ##### default

  ```heex
  <.structured_list
    rows={[%{id: "1", name: "Load Balancer 1", status: "Active"}, %{id: "2", name: "Load Balancer 2", status: "Disabled"}, %{id: "3", name: "Gateway", status: "Active"}]}
  >
    <:col :let={row} label="Name"><%= row.name %></:col>
    <:col :let={row} label="Status"><%= row.status %></:col>
  </.structured_list>
  ```

  ```html
  <cds-structured-list id="structured-list-single-default">
    
    <cds-structured-list-head>
    
      <cds-structured-list-header-row>
    
        <cds-structured-list-header-cell>
    
          Name
        
  </cds-structured-list-header-cell><cds-structured-list-header-cell>
    
          Status
        
  </cds-structured-list-header-cell>
      
  </cds-structured-list-header-row>
    
  </cds-structured-list-head>
    <cds-structured-list-body>
    
      
        <cds-structured-list-row selection-value="0">
    
          <cds-structured-list-cell>
    
            Load Balancer 1
          
  </cds-structured-list-cell><cds-structured-list-cell>
    
            Active
          
  </cds-structured-list-cell>
        
  </cds-structured-list-row>
      
        <cds-structured-list-row selection-value="1">
    
          <cds-structured-list-cell>
    
            Load Balancer 2
          
  </cds-structured-list-cell><cds-structured-list-cell>
    
            Disabled
          
  </cds-structured-list-cell>
        
  </cds-structured-list-row>
      
        <cds-structured-list-row selection-value="2">
    
          <cds-structured-list-cell>
    
            Gateway
          
  </cds-structured-list-cell><cds-structured-list-cell>
    
            Active
          
  </cds-structured-list-cell>
        
  </cds-structured-list-row>
      
    
  </cds-structured-list-body>

  </cds-structured-list>
  ```

  ##### condensed

  ```heex
  <.structured_list
    rows={[%{id: "1", name: "Load Balancer 1", status: "Active"}, %{id: "2", name: "Load Balancer 2", status: "Disabled"}, %{id: "3", name: "Gateway", status: "Active"}]}
    condensed
  >
    <:col :let={row} label="Service"><%= row.name %></:col>
    <:col :let={row} label="State"><%= row.status %></:col>
  </.structured_list>
  ```

  ```html
  <cds-structured-list condensed id="structured-list-single-condensed">
    
    <cds-structured-list-head>
    
      <cds-structured-list-header-row>
    
        <cds-structured-list-header-cell>
    
          Service
        
  </cds-structured-list-header-cell><cds-structured-list-header-cell>
    
          State
        
  </cds-structured-list-header-cell>
      
  </cds-structured-list-header-row>
    
  </cds-structured-list-head>
    <cds-structured-list-body>
    
      
        <cds-structured-list-row selection-value="0">
    
          <cds-structured-list-cell>
    
            Load Balancer 1
          
  </cds-structured-list-cell><cds-structured-list-cell>
    
            Active
          
  </cds-structured-list-cell>
        
  </cds-structured-list-row>
      
        <cds-structured-list-row selection-value="1">
    
          <cds-structured-list-cell>
    
            Load Balancer 2
          
  </cds-structured-list-cell><cds-structured-list-cell>
    
            Disabled
          
  </cds-structured-list-cell>
        
  </cds-structured-list-row>
      
        <cds-structured-list-row selection-value="2">
    
          <cds-structured-list-cell>
    
            Gateway
          
  </cds-structured-list-cell><cds-structured-list-cell>
    
            Active
          
  </cds-structured-list-cell>
        
  </cds-structured-list-row>
      
    
  </cds-structured-list-body>

  </cds-structured-list>
  ```

  ##### selectable

  ```heex
  <.structured_list
    rows={[%{id: "1", name: "Load Balancer 1", status: "Active"}, %{id: "2", name: "Load Balancer 2", status: "Disabled"}, %{id: "3", name: "Gateway", status: "Active"}]}
    selection_name="structured-list"
    selected_ids={["1"]}
    row_id={#Function<0.76553928/1 in Storybook.CarbonComponents.StructuredList.row_id>}
  >
    <:col :let={row} label="Name"><%= row.name %></:col>
    <:col :let={row} label="Status"><%= row.status %></:col>
  </.structured_list>
  ```

  ```html
  <cds-structured-list selection-name="structured-list" id="structured-list-single-selectable">
    
    <cds-structured-list-head>
    
      <cds-structured-list-header-row selection-name="structured-list">
    
        <cds-structured-list-header-cell>
    
          Name
        
  </cds-structured-list-header-cell><cds-structured-list-header-cell>
    
          Status
        
  </cds-structured-list-header-cell>
      
  </cds-structured-list-header-row>
    
  </cds-structured-list-head>
    <cds-structured-list-body>
    
      
        <cds-structured-list-row selection-name="structured-list" selection-value="0">
    
          <cds-structured-list-cell>
    
            Load Balancer 1
          
  </cds-structured-list-cell><cds-structured-list-cell>
    
            Active
          
  </cds-structured-list-cell>
        
  </cds-structured-list-row>
      
        <cds-structured-list-row selected selection-name="structured-list" selection-value="1">
    
          <cds-structured-list-cell>
    
            Load Balancer 2
          
  </cds-structured-list-cell><cds-structured-list-cell>
    
            Disabled
          
  </cds-structured-list-cell>
        
  </cds-structured-list-row>
      
        <cds-structured-list-row selection-name="structured-list" selection-value="2">
    
          <cds-structured-list-cell>
    
            Gateway
          
  </cds-structured-list-cell><cds-structured-list-cell>
    
            Active
          
  </cds-structured-list-cell>
        
  </cds-structured-list-row>
      
    
  </cds-structured-list-body>

  </cds-structured-list>
  ```


  ### `table_skeleton`

  #### data_table/skeleton

  ##### default

  ```heex
  <.table_skeleton column_count="6" row_count="5" show_header show_toolbar/>
  ```

  ```html
  <cds-table-skeleton column-count="6" row-count="5" show-header show-toolbar id="skeleton-single-default">
    
  </cds-table-skeleton>
  ```

  ##### compact

  ```heex
  <.table_skeleton column_count="4" row_count="3" show_header/>
  ```

  ```html
  <cds-table-skeleton column-count="4" row-count="3" show-header id="skeleton-single-compact">
    
  </cds-table-skeleton>
  ```

  ##### large

  ```heex
  <.table_skeleton column_count="8" row_count="8" show_header show_toolbar/>
  ```

  ```html
  <cds-table-skeleton column-count="8" row-count="8" show-header show-toolbar id="skeleton-single-large">
    
  </cds-table-skeleton>
  ```


  ### `tabs`

  #### basic

  ##### default

  ```heex
  <.tabs >
    <:tab target="tab-panel-1" title="First">First</:tab>
    <:tab target="tab-panel-2" title="Second">Second</:tab>
  </.tabs>
  ```

  ```html
  <cds-tabs selected-index="0" selected-item-assistive-text="Selected an item." selecting-items-assistive-text="Selecting items. Use up and down arrow keys to navigate." selection-mode="automatic" type="" id="basic-single-default">
    
    
      <cds-tab align="top" close-on-activation tabTitle="First" target="tab-panel-1" type="">
    
        First
      
  </cds-tab>
    
      <cds-tab align="top" close-on-activation tabTitle="Second" target="tab-panel-2" type="">
    
        Second
      
  </cds-tab>
    

  </cds-tabs>
  ```

  ##### contained

  ```heex
  <.tabs type="contained">
    <:tab target="tab-panel-a" title="Overview">Overview</:tab>
    <:tab target="tab-panel-b" title="Details">Details</:tab>
    <:tab target="tab-panel-c" title="Activity">Activity</:tab>
  </.tabs>
  ```

  ```html
  <cds-tabs selected-index="0" selected-item-assistive-text="Selected an item." selecting-items-assistive-text="Selecting items. Use up and down arrow keys to navigate." selection-mode="automatic" type="contained" id="basic-single-contained">
    
    
      <cds-tab align="top" close-on-activation tabTitle="Overview" target="tab-panel-a" type="">
    
        Overview
      
  </cds-tab>
    
      <cds-tab align="top" close-on-activation tabTitle="Details" target="tab-panel-b" type="">
    
        Details
      
  </cds-tab>
    
      <cds-tab align="top" close-on-activation tabTitle="Activity" target="tab-panel-c" type="">
    
        Activity
      
  </cds-tab>
    

  </cds-tabs>
  ```

  ##### group: sizes

  ```heex
  <.tabs size="sm">
    <:tab target="tab-panel-one" title="One">One</:tab>
    <:tab target="tab-panel-two" title="Two">Two</:tab>
  </.tabs>
  <.tabs size="md">
    <:tab target="tab-panel-one" title="One">One</:tab>
    <:tab target="tab-panel-two" title="Two">Two</:tab>
  </.tabs>
  <.tabs size="lg">
    <:tab target="tab-panel-one" title="One">One</:tab>
    <:tab target="tab-panel-two" title="Two">Two</:tab>
  </.tabs>
  <.tabs size="xl">
    <:tab target="tab-panel-one" title="One">One</:tab>
    <:tab target="tab-panel-two" title="Two">Two</:tab>
  </.tabs>
  ```

  ```html
  <cds-tabs selected-index="0" selected-item-assistive-text="Selected an item." selecting-items-assistive-text="Selecting items. Use up and down arrow keys to navigate." selection-mode="automatic" size="sm" type="" id="basic-sizes-sm">
    
    
      <cds-tab align="top" close-on-activation tabTitle="One" target="tab-panel-one" type="">
    
        One
      
  </cds-tab>
    
      <cds-tab align="top" close-on-activation tabTitle="Two" target="tab-panel-two" type="">
    
        Two
      
  </cds-tab>
    

  </cds-tabs>
  <cds-tabs selected-index="0" selected-item-assistive-text="Selected an item." selecting-items-assistive-text="Selecting items. Use up and down arrow keys to navigate." selection-mode="automatic" size="md" type="" id="basic-sizes-md">
    
    
      <cds-tab align="top" close-on-activation tabTitle="One" target="tab-panel-one" type="">
    
        One
      
  </cds-tab>
    
      <cds-tab align="top" close-on-activation tabTitle="Two" target="tab-panel-two" type="">
    
        Two
      
  </cds-tab>
    

  </cds-tabs>
  <cds-tabs selected-index="0" selected-item-assistive-text="Selected an item." selecting-items-assistive-text="Selecting items. Use up and down arrow keys to navigate." selection-mode="automatic" size="lg" type="" id="basic-sizes-lg">
    
    
      <cds-tab align="top" close-on-activation tabTitle="One" target="tab-panel-one" type="">
    
        One
      
  </cds-tab>
    
      <cds-tab align="top" close-on-activation tabTitle="Two" target="tab-panel-two" type="">
    
        Two
      
  </cds-tab>
    

  </cds-tabs>
  <cds-tabs selected-index="0" selected-item-assistive-text="Selected an item." selecting-items-assistive-text="Selecting items. Use up and down arrow keys to navigate." selection-mode="automatic" size="xl" type="" id="basic-sizes-xl">
    
    
      <cds-tab align="top" close-on-activation tabTitle="One" target="tab-panel-one" type="">
    
        One
      
  </cds-tab>
    
      <cds-tab align="top" close-on-activation tabTitle="Two" target="tab-panel-two" type="">
    
        Two
      
  </cds-tab>
    

  </cds-tabs>
  ```


  ### `tag`

  #### basic

  ##### blue

  ```heex
  <.tag type="blue">
    Blue
  </.tag>
  ```

  ```html
  <cds-tag open size="md" title="Clear filter" type="blue" id="basic-single-blue">
    
    Blue

  </cds-tag>
  ```

  ##### green

  ```heex
  <.tag type="green">
    Green
  </.tag>
  ```

  ```html
  <cds-tag open size="md" title="Clear filter" type="green" id="basic-single-green">
    
    Green

  </cds-tag>
  ```

  ##### filter

  ```heex
  <.tag type="teal" filter>
    Filter
  </.tag>
  ```

  ```html
  <cds-tag filter open size="md" title="Clear filter" type="teal" id="basic-single-filter">
    
    Filter

  </cds-tag>
  ```

  ##### group: sizes

  ```heex
  <.tag size="sm" type="cool-gray">
    SM
  </.tag>
  <.tag size="md" type="cool-gray">
    MD
  </.tag>
  <.tag size="lg" type="cool-gray">
    LG
  </.tag>
  ```

  ```html
  <cds-tag open size="sm" title="Clear filter" type="cool-gray" id="basic-sizes-sm">
    
    SM

  </cds-tag>
  <cds-tag open size="md" title="Clear filter" type="cool-gray" id="basic-sizes-md">
    
    MD

  </cds-tag>
  <cds-tag open size="lg" title="Clear filter" type="cool-gray" id="basic-sizes-lg">
    
    LG

  </cds-tag>
  ```


  ### `text_input`

  #### basic

  ##### default

  ```heex
  <.text_input name="text-input-default" value="Ada">
    <:label_text>First name</:label_text>
  </.text_input>
  ```

  ```html
  <input type="hidden" id="text-input-default-input" name="text-input-default" value="Ada">
  <cds-text-input hidePasswordLabel="Hide password" name="text-input-default" required-validity-message="Please fill out this field." showPasswordLabel="Show password" size="md" tooltipAlignment="center" tooltipDirection="bottom" type="text" value="Ada" id="basic-single-default" data-form-detail="checked" data-form-event="input" data-form-input="text-input-default-input" data-form-mode="value" phx-hook="Graphene.FormComponents.GrapheneFormBridge">
    
    
    
    <div slot="label-text">
      First name
    </div>
    
  </cds-text-input>
  ```

  ##### helper_text

  ```heex
  <.text_input name="text-input-helper" value="Lovelace">
    <:label_text>Last name</:label_text>
    <:helper_text>As shown on your ID</:helper_text>
  </.text_input>
  ```

  ```html
  <input type="hidden" id="text-input-helper-input" name="text-input-helper" value="Lovelace">
  <cds-text-input hidePasswordLabel="Hide password" name="text-input-helper" required-validity-message="Please fill out this field." showPasswordLabel="Show password" size="md" tooltipAlignment="center" tooltipDirection="bottom" type="text" value="Lovelace" id="basic-single-helper-text" data-form-detail="checked" data-form-event="input" data-form-input="text-input-helper-input" data-form-mode="value" phx-hook="Graphene.FormComponents.GrapheneFormBridge">
    
    
    <div slot="helper-text">
      As shown on your ID
    </div>
    <div slot="label-text">
      Last name
    </div>
    
  </cds-text-input>
  ```

  ##### invalid

  ```heex
  <.text_input invalid name="text-input-invalid" value="" invalid_text="Required">
    <:label_text>Username</:label_text>
  </.text_input>
  ```

  ```html
  <input type="hidden" id="text-input-invalid-input" name="text-input-invalid" value="">
  <cds-text-input hidePasswordLabel="Hide password" invalid invalid-text="Required" name="text-input-invalid" required-validity-message="Please fill out this field." showPasswordLabel="Show password" size="md" tooltipAlignment="center" tooltipDirection="bottom" type="text" value="" id="basic-single-invalid" data-form-detail="checked" data-form-event="input" data-form-input="text-input-invalid-input" data-form-mode="value" phx-hook="Graphene.FormComponents.GrapheneFormBridge">
    
    
    
    <div slot="label-text">
      Username
    </div>
    
  </cds-text-input>
  ```


  ### `textarea`

  #### basic

  ##### default

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

  ##### helper_text

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

  ##### invalid

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


  ### `tile`

  ##### default

  ```heex
  <.tile >
    Basic tile
  </.tile>
  ```

  ```html
  <cds-tile color-scheme="" id="tile-single-default">
    
    Basic tile

    
  </cds-tile>
  ```

  ##### light

  ```heex
  <.tile color_scheme="light">
    Light tile
  </.tile>
  ```

  ```html
  <cds-tile color-scheme="light" id="tile-single-light">
    
    Light tile

    
  </cds-tile>
  ```

  ##### rounded

  ```heex
  <.tile has_rounded_corners>
    Rounded corners
  </.tile>
  ```

  ```html
  <cds-tile color-scheme="" has-rounded-corners id="tile-single-rounded">
    
    Rounded corners

    
  </cds-tile>
  ```


  ### `time_picker`

  #### basic

  ##### default

  ```heex
  <.time_picker name="time-picker-default" value="12:00">
    <:label_text>Start time</:label_text>
    <:select_item value="UTC" selected>UTC</:select_item>
    <:select_item value="PST">PST</:select_item>
  </.time_picker>
  ```

  ```html
  <input type="hidden" id="time-picker-default-input" name="time-picker-default" value="12:00">
  <cds-time-picker invalid-text="Invalid time format." max-length="5" name="time-picker-default" pattern="(1[012]|[1-9]):[0-5][0-9](\\s)?" placeholder="hh:mm" required-validity-message="Please fill out this field." size="md" type="text" value="12:00" warning-text="Warning message." id="basic-single-default" data-form-detail="checked" data-form-event="change" data-form-input="time-picker-default-input" data-form-mode="value" phx-hook="Graphene.FormComponents.GrapheneFormBridge">
    
    <div slot="label-text">
      Start time
    </div>
    
    <cds-time-picker-select size="md">
    
      
        <cds-select-item selected value="UTC">
    
          UTC
        
  </cds-select-item>
      
        <cds-select-item value="PST">
    
          PST
        
  </cds-select-item>
      
    
  </cds-time-picker-select>

    
    
    
  </cds-time-picker>
  ```

  ##### with_timezone

  ```heex
  <.time_picker name="time-picker-timezone" value="09:30">
    <:label_text>Meeting time</:label_text>
    <:select_item value="UTC" selected>UTC</:select_item>
    <:select_item value="CET">CET</:select_item>
  </.time_picker>
  ```

  ```html
  <input type="hidden" id="time-picker-timezone-input" name="time-picker-timezone" value="09:30">
  <cds-time-picker invalid-text="Invalid time format." max-length="5" name="time-picker-timezone" pattern="(1[012]|[1-9]):[0-5][0-9](\\s)?" placeholder="hh:mm" required-validity-message="Please fill out this field." size="md" type="text" value="09:30" warning-text="Warning message." id="basic-single-with-timezone" data-form-detail="checked" data-form-event="change" data-form-input="time-picker-timezone-input" data-form-mode="value" phx-hook="Graphene.FormComponents.GrapheneFormBridge">
    
    <div slot="label-text">
      Meeting time
    </div>
    
    <cds-time-picker-select size="md">
    
      
        <cds-select-item selected value="UTC">
    
          UTC
        
  </cds-select-item>
      
        <cds-select-item value="CET">
    
          CET
        
  </cds-select-item>
      
    
  </cds-time-picker-select>

    
    
    
  </cds-time-picker>
  ```

  ##### invalid

  ```heex
  <.time_picker invalid name="time-picker-invalid" value="" invalid_text="Enter a time">
    <:label_text>Start time</:label_text>
    <:select_item value="UTC" selected>UTC</:select_item>
  </.time_picker>
  ```

  ```html
  <input type="hidden" id="time-picker-invalid-input" name="time-picker-invalid" value="">
  <cds-time-picker invalid invalid-text="Enter a time" max-length="5" name="time-picker-invalid" pattern="(1[012]|[1-9]):[0-5][0-9](\\s)?" placeholder="hh:mm" required-validity-message="Please fill out this field." size="md" type="text" value="" warning-text="Warning message." id="basic-single-invalid" data-form-detail="checked" data-form-event="change" data-form-input="time-picker-invalid-input" data-form-mode="value" phx-hook="Graphene.FormComponents.GrapheneFormBridge">
    
    <div slot="label-text">
      Start time
    </div>
    
    <cds-time-picker-select size="md">
    
      
        <cds-select-item selected value="UTC">
    
          UTC
        
  </cds-select-item>
      
    
  </cds-time-picker-select>

    
    
    
  </cds-time-picker>
  ```


  ### `toast_notification`

  #### notification/toast

  ##### success

  ```heex
  <.toast_notification timeout="3000" kind="success">
    <:title>Saved</:title>
    <:subtitle>Your changes were saved</:subtitle>
  </.toast_notification>
  ```

  ```html
  <cds-toast-notification kind="success" open timeout="3000" id="toast-single-success">
    
    
    <div slot="subtitle">
      Your changes were saved
    </div>
    <div slot="title">
      Saved
    </div>
  </cds-toast-notification>
  ```

  ##### info

  ```heex
  <.toast_notification timeout="5000" kind="info">
    <:title>New message</:title>
    <:subtitle>You have unread messages</:subtitle>
  </.toast_notification>
  ```

  ```html
  <cds-toast-notification kind="info" open timeout="5000" id="toast-single-info">
    
    
    <div slot="subtitle">
      You have unread messages
    </div>
    <div slot="title">
      New message
    </div>
  </cds-toast-notification>
  ```

  ##### error

  ```heex
  <.toast_notification timeout="3000" kind="error">
    <:title>Failed</:title>
    <:subtitle>Try again</:subtitle>
  </.toast_notification>
  ```

  ```html
  <cds-toast-notification kind="error" open timeout="3000" id="toast-single-error">
    
    
    <div slot="subtitle">
      Try again
    </div>
    <div slot="title">
      Failed
    </div>
  </cds-toast-notification>
  ```


  ### `toggle`

  #### basic

  ##### on

  ```heex
  <.toggle id="basic-single-on" name="toggle-on" label_a="On" label_b="Off" toggled>
    <:label_text>Notifications</:label_text>
  </.toggle>
  ```

  ```html
  <input type="hidden" id="basic-single-on-input" name="toggle-on" value="true">
  <cds-toggle checked id="checkbox" label-a="On" label-b="Off" name="toggle-on" size="" toggled id="basic-single-on" data-form-detail="toggled" data-form-event="cds-toggle-changed" data-form-input="basic-single-on-input" data-form-mode="boolean" phx-hook="Graphene.FormComponents.GrapheneFormBridge">
    
    
    
    <div slot="label-text">
      Notifications
    </div>
    
  </cds-toggle>
  ```

  ##### off

  ```heex
  <.toggle id="basic-single-off" name="toggle-off" label_a="On" label_b="Off">
    <:label_text>Notifications</:label_text>
  </.toggle>
  ```

  ```html
  <input type="hidden" id="basic-single-off-input" name="toggle-off" value="false">
  <cds-toggle id="checkbox" label-a="On" label-b="Off" name="toggle-off" size="" id="basic-single-off" data-form-detail="toggled" data-form-event="cds-toggle-changed" data-form-input="basic-single-off-input" data-form-mode="boolean" phx-hook="Graphene.FormComponents.GrapheneFormBridge">
    
    
    
    <div slot="label-text">
      Notifications
    </div>
    
  </cds-toggle>
  ```

  ##### disabled

  ```heex
  <.toggle
    disabled
    id="basic-single-disabled"
    name="toggle-disabled"
    label_a="On"
    label_b="Off"
  >
    <:label_text>Disabled</:label_text>
  </.toggle>
  ```

  ```html
  <input type="hidden" id="basic-single-disabled-input" name="toggle-disabled" value="false">
  <cds-toggle disabled id="checkbox" label-a="On" label-b="Off" name="toggle-disabled" size="" id="basic-single-disabled" data-form-detail="toggled" data-form-event="cds-toggle-changed" data-form-input="basic-single-disabled-input" data-form-mode="boolean" phx-hook="Graphene.FormComponents.GrapheneFormBridge">
    
    
    
    <div slot="label-text">
      Disabled
    </div>
    
  </cds-toggle>
  ```


  ### `toggletip`

  ##### default

  ```heex
  <.toggletip alignment="bottom" default_open>
    Toggletip label
    <:body_text>
      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
    </:body_text>
    <:action>
      <Graphene.CarbonComponents.link href="#">Link action</Graphene.CarbonComponents.link>
    </:action>
    <:action>
      <Graphene.CarbonComponents.button size="sm">Button</Graphene.CarbonComponents.button>
    </:action>
  </.toggletip>
  ```

  ```html
  <cds-toggletip alignment="bottom" alignment-axis-offset="0" button-label="Show information" default-open id="toggletip-single-default">
    
    
    Toggletip label

    <div slot="body-text">
      
    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>

    </div>
    <div slot="actions">
      
    <cds-link href="#" size="MEDIUM">
    Link action
  </cds-link>

    </div><div slot="actions">
      
    <cds-button kind="primary" link-role="button" size="sm" tab-index="0" tooltip-alignment="" tooltip-position="top" type="button">
    Button
    
  </cds-button>

    </div>

    
    
  </cds-toggletip>
  ```

  ##### top

  ```heex
  <.toggletip alignment="top">
    Info
    <:body_text>
      <p>More details about this option.</p>
    </:body_text>
  </.toggletip>
  ```

  ```html
  <cds-toggletip alignment="top" alignment-axis-offset="0" button-label="Show information" id="toggletip-single-top">
    
    Info

    <div slot="body-text">
      
    <p>More details about this option.</p>

    </div>
    
  </cds-toggletip>
  ```

  ##### right

  ```heex
  <.toggletip alignment="right">
    Help
    <:body_text>
      <p>Short description goes here.</p>
    </:body_text>
    <:action>
      <Graphene.CarbonComponents.button size="sm">Got it</Graphene.CarbonComponents.button>
    </:action>
  </.toggletip>
  ```

  ```html
  <cds-toggletip alignment="right" alignment-axis-offset="0" button-label="Show information" id="toggletip-single-right">
    
    
    Help

    <div slot="body-text">
      
    <p>Short description goes here.</p>

    </div>
    <div slot="actions">
      
    <cds-button kind="primary" link-role="button" size="sm" tab-index="0" tooltip-alignment="" tooltip-position="top" type="button">
    Got it
    
  </cds-button>

    </div>

    
    
  </cds-toggletip>
  ```


  ### `tooltip`

  #### basic

  ##### bottom

  ```heex
  <.tooltip align="bottom">
    <Graphene.CarbonComponents.button kind="ghost" aria-labelledby="tooltip-content">Hover me</Graphene.CarbonComponents.button>
    <:content id="tooltip-content">Tooltip content</:content>
  </.tooltip>
  ```

  ```html
  <cds-tooltip align="bottom" backgroundToken="layer" caret dropShadow enter-delay-ms="100" leave-delay-ms="300" timeoutId="0" id="basic-single-bottom">
    
    
    
      <cds-tooltip-content backgroundToken="layer" dropShadow slot="content" id="tooltip-content">
    
        Tooltip content
      
  </cds-tooltip-content>
    
    
    <cds-button kind="ghost" link-role="button" size="lg" tab-index="0" tooltip-alignment="" tooltip-position="top" type="button" aria-labelledby="tooltip-content">
    Hover me
    
  </cds-button>


  </cds-tooltip>
  ```

  ##### top

  ```heex
  <.tooltip align="top">
    <Graphene.CarbonComponents.button kind="ghost" aria-labelledby="tooltip-top">Top tooltip</Graphene.CarbonComponents.button>
    <:content id="tooltip-top">Top content</:content>
  </.tooltip>
  ```

  ```html
  <cds-tooltip align="top" backgroundToken="layer" caret dropShadow enter-delay-ms="100" leave-delay-ms="300" timeoutId="0" id="basic-single-top">
    
    
    
      <cds-tooltip-content backgroundToken="layer" dropShadow slot="content" id="tooltip-top">
    
        Top content
      
  </cds-tooltip-content>
    
    
    <cds-button kind="ghost" link-role="button" size="lg" tab-index="0" tooltip-alignment="" tooltip-position="top" type="button" aria-labelledby="tooltip-top">
    Top tooltip
    
  </cds-button>


  </cds-tooltip>
  ```

  ##### right

  ```heex
  <.tooltip align="right">
    <Graphene.CarbonComponents.button kind="ghost" aria-labelledby="tooltip-right">Right tooltip</Graphene.CarbonComponents.button>
    <:content id="tooltip-right">Right content</:content>
  </.tooltip>
  ```

  ```html
  <cds-tooltip align="right" backgroundToken="layer" caret dropShadow enter-delay-ms="100" leave-delay-ms="300" timeoutId="0" id="basic-single-right">
    
    
    
      <cds-tooltip-content backgroundToken="layer" dropShadow slot="content" id="tooltip-right">
    
        Right content
      
  </cds-tooltip-content>
    
    
    <cds-button kind="ghost" link-role="button" size="lg" tab-index="0" tooltip-alignment="" tooltip-position="top" type="button" aria-labelledby="tooltip-right">
    Right tooltip
    
  </cds-button>


  </cds-tooltip>
  ```


  ### `tree_view`

  #### basic

  ##### default

  ```heex
  <.tree_view label="Primary navigation">
    <Graphene.CarbonComponents.tree_node label="Products" is_expanded={true} id="products">
      <Graphene.CarbonComponents.tree_node label="Catalog" id="catalog" />
      <Graphene.CarbonComponents.tree_node label="Pricing" id="pricing" />
      <Graphene.CarbonComponents.tree_node label="Releases" id="releases" />
    </Graphene.CarbonComponents.tree_node>
    <Graphene.CarbonComponents.tree_node label="Teams" is_expanded={true} id="teams">
      <Graphene.CarbonComponents.tree_node label="Design" id="design" />
      <Graphene.CarbonComponents.tree_node label="Engineering" id="engineering" selected />
      <Graphene.CarbonComponents.tree_node label="Marketing" id="marketing" disabled />
    </Graphene.CarbonComponents.tree_node>
    <Graphene.CarbonComponents.tree_node label="Settings" id="settings" active />
  </.tree_view>
  ```

  ```html
  <cds-tree-view label="Primary navigation" size="sm" id="basic-single-default">
    
    <cds-tree-node id="products" is-expanded label="Products">
    
    <cds-tree-node id="catalog" label="Catalog">
    
  </cds-tree-node>
    <cds-tree-node id="pricing" label="Pricing">
    
  </cds-tree-node>
    <cds-tree-node id="releases" label="Releases">
    
  </cds-tree-node>

  </cds-tree-node>
  <cds-tree-node id="teams" is-expanded label="Teams">
    
    <cds-tree-node id="design" label="Design">
    
  </cds-tree-node>
    <cds-tree-node id="engineering" label="Engineering" selected>
    
  </cds-tree-node>
    <cds-tree-node disabled id="marketing" label="Marketing">
    
  </cds-tree-node>

  </cds-tree-node>
  <cds-tree-node active id="settings" label="Settings">
    
  </cds-tree-node>

  </cds-tree-view>
  ```

  ##### nested

  ```heex
  <.tree_view label="Workspace navigation">
    <Graphene.CarbonComponents.tree_node label="Projects" is_expanded={true} id="projects">
      <Graphene.CarbonComponents.tree_node label="Alpha" id="alpha" />
      <Graphene.CarbonComponents.tree_node label="Beta" id="beta" />
      <Graphene.CarbonComponents.tree_node label="Gamma" id="gamma" />
    </Graphene.CarbonComponents.tree_node>
    <Graphene.CarbonComponents.tree_node label="Analytics" is_expanded={true} id="analytics">
      <Graphene.CarbonComponents.tree_node label="Dashboards" id="dashboards" />
      <Graphene.CarbonComponents.tree_node label="Reports" id="reports" />
    </Graphene.CarbonComponents.tree_node>
    <Graphene.CarbonComponents.tree_node label="Settings" id="settings" />
  </.tree_view>
  ```

  ```html
  <cds-tree-view label="Workspace navigation" size="sm" id="basic-single-nested">
    
    <cds-tree-node id="projects" is-expanded label="Projects">
    
    <cds-tree-node id="alpha" label="Alpha">
    
  </cds-tree-node>
    <cds-tree-node id="beta" label="Beta">
    
  </cds-tree-node>
    <cds-tree-node id="gamma" label="Gamma">
    
  </cds-tree-node>

  </cds-tree-node>
  <cds-tree-node id="analytics" is-expanded label="Analytics">
    
    <cds-tree-node id="dashboards" label="Dashboards">
    
  </cds-tree-node>
    <cds-tree-node id="reports" label="Reports">
    
  </cds-tree-node>

  </cds-tree-node>
  <cds-tree-node id="settings" label="Settings">
    
  </cds-tree-node>

  </cds-tree-view>
  ```

  ##### sizes

  ```heex
  <.tree_view label="Small tree" size="sm">
    <Graphene.CarbonComponents.tree_node label="Favorites" is_expanded={true} id="favorites">
      <Graphene.CarbonComponents.tree_node label="Overview" id="overview" />
      <Graphene.CarbonComponents.tree_node label="Recently viewed" id="recent" />
    </Graphene.CarbonComponents.tree_node>
    <Graphene.CarbonComponents.tree_node label="Archive" id="archive" />
  </.tree_view>
  ```

  ```html
  <cds-tree-view label="Small tree" size="sm" id="basic-single-sizes">
    
    <cds-tree-node id="favorites" is-expanded label="Favorites">
    
    <cds-tree-node id="overview" label="Overview">
    
  </cds-tree-node>
    <cds-tree-node id="recent" label="Recently viewed">
    
  </cds-tree-node>

  </cds-tree-node>
  <cds-tree-node id="archive" label="Archive">
    
  </cds-tree-node>

  </cds-tree-view>
  ```


  ### `ui_shell`

  ##### example

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


  ### `unordered_list`

  #### list/unordered

  ##### default

  ```heex
  <.unordered_list >
    <:item>First item</:item>
    <:item>Second item</:item>
    <:item>Third item</:item>
  </.unordered_list>
  ```

  ```html
  <cds-unordered-list id="unordered-single-default">
    
    
      <cds-list-item>
    
        First item
      
    
  </cds-list-item>
    
      <cds-list-item>
    
        Second item
      
    
  </cds-list-item>
    
      <cds-list-item>
    
        Third item
      
    
  </cds-list-item>
    
    
    

  </cds-unordered-list>
  ```

  ##### nested

  ```heex
  <.unordered_list nested>
    <:item>Outer item</:item>
    <:item>Another item</:item>
  </.unordered_list>
  ```

  ```html
  <cds-unordered-list nested id="unordered-single-nested">
    
    
      <cds-list-item>
    
        Outer item
      
    
  </cds-list-item>
    
      <cds-list-item>
    
        Another item
      
    
  </cds-list-item>
    
    
    

  </cds-unordered-list>
  ```

  ##### expressive

  ```heex
  <.unordered_list is_expressive>
    <:item>Expressive one</:item>
    <:item>Expressive two</:item>
  </.unordered_list>
  ```

  ```html
  <cds-unordered-list is-expressive id="unordered-single-expressive">
    
    
      <cds-list-item>
    
        Expressive one
      
    
  </cds-list-item>
    
      <cds-list-item>
    
        Expressive two
      
    
  </cds-list-item>
    
    
    

  </cds-unordered-list>
  ```

  <!-- STORYBOOK_DOCS:END -->
  """

  defmacro __using__(opts) do
    quote do
      use Graphene.Components, unquote(opts)
    end
  end
end
