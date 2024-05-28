defmodule LiveviewNestedFormTestWeb.PageNested do
  use LiveviewNestedFormTestWeb, :live_view

  @impl true
  def mount(_, _, socket) do
    socket
    |> assign(output: nil)
    |> then(&{:ok, &1})
  end

  @impl true
  def handle_event("SUBMIT", %{"field" => value}, socket) do
    socket
    |> assign(output: value)
    |> then(&{:noreply, &1})
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div id="nested_root">
      <form id="nested_form" phx-submit="SUBMIT" phx-target="#nested_root">
        <input type="text" name="field" />
        <div :if={@output} id="output"><%= @output %></div>
      </form>
    </div>
    """
  end
end
