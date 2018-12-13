defmodule DbWeb.Server_FlagView do
  use DbWeb, :view
  alias DbWeb.Server_FlagView

  def render("index.json", %{server_flags: server_flags}) do
    %{data: render_many(server_flags, Server_FlagView, "server__flag.json")}
  end

  def render("show.json", %{server__flag: server__flag}) do
    %{data: render_one(server__flag, Server_FlagView, "server__flag.json")}
  end

  def render("server__flag.json", %{server__flag: server__flag}) do
    %{id: server__flag.id,
      version: server__flag.version,
      release_notes: server__flag.release_notes}
  end
end
