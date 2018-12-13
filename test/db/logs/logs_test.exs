defmodule Db.LogsTest do
  use Db.DataCase

  alias Db.Logs

  describe "logs" do
    alias Db.Logs.Log

    @valid_attrs %{category: "some category", content: "some content", context: "some context"}
    @update_attrs %{category: "some updated category", content: "some updated content", context: "some updated context"}
    @invalid_attrs %{category: nil, content: nil, context: nil}

    def log_fixture(attrs \\ %{}) do
      {:ok, log} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Logs.create_log()

      log
    end

    test "list_logs/0 returns all logs" do
      log = log_fixture()
      assert Logs.list_logs() == [log]
    end

    test "get_log!/1 returns the log with given id" do
      log = log_fixture()
      assert Logs.get_log!(log.id) == log
    end

    test "create_log/1 with valid data creates a log" do
      assert {:ok, %Log{} = log} = Logs.create_log(@valid_attrs)
      assert log.category == "some category"
      assert log.content == "some content"
      assert log.context == "some context"
    end

    test "create_log/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Logs.create_log(@invalid_attrs)
    end

    test "update_log/2 with valid data updates the log" do
      log = log_fixture()
      assert {:ok, log} = Logs.update_log(log, @update_attrs)
      assert %Log{} = log
      assert log.category == "some updated category"
      assert log.content == "some updated content"
      assert log.context == "some updated context"
    end

    test "update_log/2 with invalid data returns error changeset" do
      log = log_fixture()
      assert {:error, %Ecto.Changeset{}} = Logs.update_log(log, @invalid_attrs)
      assert log == Logs.get_log!(log.id)
    end

    test "delete_log/1 deletes the log" do
      log = log_fixture()
      assert {:ok, %Log{}} = Logs.delete_log(log)
      assert_raise Ecto.NoResultsError, fn -> Logs.get_log!(log.id) end
    end

    test "change_log/1 returns a log changeset" do
      log = log_fixture()
      assert %Ecto.Changeset{} = Logs.change_log(log)
    end
  end
end
