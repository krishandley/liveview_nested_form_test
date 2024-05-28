defmodule LiveviewNestedFormTestWeb.PageLive do
  use LiveviewNestedFormTestWeb, :live_view

  @impl true
  def mount(_, _, socket) do
    socket
    |> then(&{:ok, &1})
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <%= live_render(@socket, LiveviewNestedFormTestWeb.PageNested, id: "nested") %>
    </div>
    """
  end
end
