defmodule Db.Server_Flag_Resolver do

    alias Db.Server_Flags

    def all(_args, _info) do
        {:ok, Server_Flags.list_server_flags}
    end

    def find(%{id: id}, _info) do
        case Server_Flags.get_server__flag!(id) do
            nil -> {:error, "server_flag with id #{id} not found."}
            server_flag -> {:ok, server_flag}
        end
    end

    def create(args, _info) do
        Server_Flags.create_server__flag(args)
    end

    def update(%{id: id, server_flag: server_flag_params}, _info) do
        Server_Flags.get_server__flag!(id)
        |> Server_Flags.update_server__flag(server_flag_params)
    end

    def delete(%{id: id}, _info) do
        Server_Flags.get_server__flag!(id)
        |> Server_Flags.delete_server__flag
    end

end