defmodule DbWeb.LogView do
  use DbWeb, :view
  alias DbWeb.LogView

  def render("index.json", %{logs: logs}) do
    %{data: render_many(logs, LogView, "log.json")}
  end

  def render("show.json", %{log: log}) do
    %{data: render_one(log, LogView, "log.json")}
  end

  def render("log.json", %{log: log}) do
    %{id: log.id,
      content: log.content,
      context: log.context,
      category: log.category}
  end
end
