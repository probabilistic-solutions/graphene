defmodule Graphene.IconsTest do
  use ExUnit.Case, async: true
  import Phoenix.Component
  import Phoenix.LiveViewTest
  import Graphene.Icons, only: [icon: 1]

  test "icon template" do
    assigns = %{}

    assert rendered_to_string(~H"""
           <.icon name="3d-cursor" />
           """) =~
             ~S|<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden fill="currentColor" height="24px" preserveAspectRatio="xMidYMid meet" width="24px">|
  end

  test "icon sizes" do
    assigns = %{}

    assert rendered_to_string(~H"""
           <.icon name="3d-cursor" size={16} />
           """) =~
             ~S|<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden fill="currentColor" height="16px" preserveAspectRatio="xMidYMid meet" width="16px">|

    assert rendered_to_string(~H"""
           <.icon name="3d-cursor" size={20} />
           """) =~
             ~S|<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden fill="currentColor" height="20px" preserveAspectRatio="xMidYMid meet" width="20px">|

    assert rendered_to_string(~H"""
           <.icon name="3d-cursor" size={24} />
           """) =~
             ~S|<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden fill="currentColor" height="24px" preserveAspectRatio="xMidYMid meet" width="24px">|

    assert rendered_to_string(~H"""
           <.icon name="3d-cursor" size={32} />
           """) =~
             ~S|<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden fill="currentColor" height="32px" preserveAspectRatio="xMidYMid meet" width="32px">|
  end

  test "icon custom size" do
    assigns = %{}

    assert rendered_to_string(~H"""
           <.icon name="3d-cursor" width="auto" height="auto" />
           """) =~
             ~S|<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden fill="currentColor" height="auto" preserveAspectRatio="xMidYMid meet" width="auto">|
  end

  test "icon custom attributes" do
    assigns = %{}

    assert rendered_to_string(~H"""
           <.icon name="3d-cursor" aria-hidden="false" class="icon" />
           """) =~
             ~S|<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="false" class="icon" fill="currentColor" height="24px" preserveAspectRatio="xMidYMid meet" width="24px">|
  end

  test "icon aria label should set role img and remove aria-hidden" do
    assigns = %{}

    assert rendered_to_string(~H"""
           <.icon name="3d-cursor" aria-label="my label" class="icon" />
           """) =~
             ~S|<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-label="my label" class="icon" fill="currentColor" height="24px" preserveAspectRatio="xMidYMid meet" role="img" width="24px">|
  end

  test "icon tab index without labels does not set anything else" do
    assigns = %{}

    assert rendered_to_string(~H"""
           <.icon name="3d-cursor" tabindex="0" />
           """) =~
             ~S|<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" tabindex="0" aria-hidden fill="currentColor" height="24px" preserveAspectRatio="xMidYMid meet" width="24px">|
  end

  test "icon tab index with labels sets role img other attrs" do
    assigns = %{}

    assert rendered_to_string(~H"""
           <.icon name="3d-cursor" tabindex="0" aria-label="my label" />
           """) =~
             ~S|<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-label="my label" tabindex="0" fill="currentColor" focusable height="24px" preserveAspectRatio="xMidYMid meet" role="img" width="24px">|
  end

  test "icon title element" do
    assigns = %{}

    component =
      rendered_to_string(~H"""
      <.icon name="3d-cursor" tabindex="0" title="my label" />
      """)

    assert component =~
             ~S|<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" tabindex="0" fill="currentColor" focusable height="24px" preserveAspectRatio="xMidYMid meet" role="img" width="24px">|

    assert component =~ ~S|<title>my label</title>|
  end
end
