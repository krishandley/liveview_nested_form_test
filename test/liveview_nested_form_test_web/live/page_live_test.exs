defmodule LiveviewNestedFormTestWeb.PageLiveTest do
  use LiveviewNestedFormTestWeb.ConnCase

  import Phoenix.LiveViewTest

  test "/", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/")

    view
    # with_target does not help either.
    # |> with_target("#nested_root")
    |> form("#nested_form", %{})
    |> render_submit()

    assert view
           |> element("#output")
           |> has_element?()
  end
end
