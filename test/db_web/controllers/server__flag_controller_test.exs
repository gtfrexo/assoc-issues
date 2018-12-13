defmodule DbWeb.Server_FlagControllerTest do
  use DbWeb.ConnCase

  alias Db.Server_Flags
  alias Db.Server_Flags.Server_Flag

  @create_attrs %{release_notes: "some release_notes", version: "some version"}
  @update_attrs %{release_notes: "some updated release_notes", version: "some updated version"}
  @invalid_attrs %{release_notes: nil, version: nil}

  def fixture(:server__flag) do
    {:ok, server__flag} = Server_Flags.create_server__flag(@create_attrs)
    server__flag
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all server_flags", %{conn: conn} do
      conn = get conn, server__flag_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create server__flag" do
    test "renders server__flag when data is valid", %{conn: conn} do
      conn = post conn, server__flag_path(conn, :create), server__flag: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, server__flag_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "release_notes" => "some release_notes",
        "version" => "some version"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, server__flag_path(conn, :create), server__flag: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update server__flag" do
    setup [:create_server__flag]

    test "renders server__flag when data is valid", %{conn: conn, server__flag: %Server_Flag{id: id} = server__flag} do
      conn = put conn, server__flag_path(conn, :update, server__flag), server__flag: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, server__flag_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "release_notes" => "some updated release_notes",
        "version" => "some updated version"}
    end

    test "renders errors when data is invalid", %{conn: conn, server__flag: server__flag} do
      conn = put conn, server__flag_path(conn, :update, server__flag), server__flag: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete server__flag" do
    setup [:create_server__flag]

    test "deletes chosen server__flag", %{conn: conn, server__flag: server__flag} do
      conn = delete conn, server__flag_path(conn, :delete, server__flag)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, server__flag_path(conn, :show, server__flag)
      end
    end
  end

  defp create_server__flag(_) do
    server__flag = fixture(:server__flag)
    {:ok, server__flag: server__flag}
  end
end
