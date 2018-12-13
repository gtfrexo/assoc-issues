defmodule Db.Log_Resolver do

    alias Db.Logs

    def all(_args, _info) do
        {:ok, Logs.list_logs}
    end

    def find(%{id: id}, _info) do
        case Logs.get_log!(id) do
            nil -> {:error, "log with id #{id} not found."}
            log -> {:ok, log}
        end
    end

    def create(args, _info) do
        Logs.create_log(args)
    end

    def update(%{id: id, log: log_params}, _info) do
        Logs.get_log!(id)
        |> Logs.update_log(log_params)
    end

    def delete(%{id: id}, _info) do
        Logs.get_log!(id)
        |> Logs.delete_log
    end

end