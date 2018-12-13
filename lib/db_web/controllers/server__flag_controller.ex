defmodule DbWeb.Server_FlagController do
  use DbWeb, :controller

  alias Db.Server_Flags
  alias Db.Server_Flags.Server_Flag

  action_fallback DbWeb.FallbackController

  def index(conn, _params) do
    server_flags = Server_Flags.list_server_flags()
    render(conn, "index.json", server_flags: server_flags)
  end

  def create(conn, %{"server__flag" => server__flag_params}) do
    with {:ok, %Server_Flag{} = server__flag} <- Server_Flags.create_server__flag(server__flag_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", server__flag_path(conn, :show, server__flag))
      |> render("show.json", server__flag: server__flag)
    end
  end

  def show(conn, %{"id" => id}) do
    server__flag = Server_Flags.get_server__flag!(id)
    render(conn, "show.json", server__flag: server__flag)
  end

  def update(conn, %{"id" => id, "server__flag" => server__flag_params}) do
    server__flag = Server_Flags.get_server__flag!(id)

    with {:ok, %Server_Flag{} = server__flag} <- Server_Flags.update_server__flag(server__flag, server__flag_params) do
      render(conn, "show.json", server__flag: server__flag)
    end
  end

  def delete(conn, %{"id" => id}) do
    server__flag = Server_Flags.get_server__flag!(id)
    with {:ok, %Server_Flag{}} <- Server_Flags.delete_server__flag(server__flag) do
      send_resp(conn, :no_content, "")
    end
  end
end
