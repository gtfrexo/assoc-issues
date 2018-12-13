defmodule Db.Server_FlagsTest do
  use Db.DataCase

  alias Db.Server_Flags

  describe "server_flags" do
    alias Db.Server_Flags.Server_Flag

    @valid_attrs %{release_notes: "some release_notes", version: "some version"}
    @update_attrs %{release_notes: "some updated release_notes", version: "some updated version"}
    @invalid_attrs %{release_notes: nil, version: nil}

    def server__flag_fixture(attrs \\ %{}) do
      {:ok, server__flag} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Server_Flags.create_server__flag()

      server__flag
    end

    test "list_server_flags/0 returns all server_flags" do
      server__flag = server__flag_fixture()
      assert Server_Flags.list_server_flags() == [server__flag]
    end

    test "get_server__flag!/1 returns the server__flag with given id" do
      server__flag = server__flag_fixture()
      assert Server_Flags.get_server__flag!(server__flag.id) == server__flag
    end

    test "create_server__flag/1 with valid data creates a server__flag" do
      assert {:ok, %Server_Flag{} = server__flag} = Server_Flags.create_server__flag(@valid_attrs)
      assert server__flag.release_notes == "some release_notes"
      assert server__flag.version == "some version"
    end

    test "create_server__flag/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Server_Flags.create_server__flag(@invalid_attrs)
    end

    test "update_server__flag/2 with valid data updates the server__flag" do
      server__flag = server__flag_fixture()
      assert {:ok, server__flag} = Server_Flags.update_server__flag(server__flag, @update_attrs)
      assert %Server_Flag{} = server__flag
      assert server__flag.release_notes == "some updated release_notes"
      assert server__flag.version == "some updated version"
    end

    test "update_server__flag/2 with invalid data returns error changeset" do
      server__flag = server__flag_fixture()
      assert {:error, %Ecto.Changeset{}} = Server_Flags.update_server__flag(server__flag, @invalid_attrs)
      assert server__flag == Server_Flags.get_server__flag!(server__flag.id)
    end

    test "delete_server__flag/1 deletes the server__flag" do
      server__flag = server__flag_fixture()
      assert {:ok, %Server_Flag{}} = Server_Flags.delete_server__flag(server__flag)
      assert_raise Ecto.NoResultsError, fn -> Server_Flags.get_server__flag!(server__flag.id) end
    end

    test "change_server__flag/1 returns a server__flag changeset" do
      server__flag = server__flag_fixture()
      assert %Ecto.Changeset{} = Server_Flags.change_server__flag(server__flag)
    end
  end
end
