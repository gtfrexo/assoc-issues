defmodule DbWeb.Context do
    @behaviour Plug
   
    import Plug.Conn
    import Ecto.Query, only: [where: 2]
   
    alias Db.Repo
    alias Db.Persons.Person
   
    def init(opts), do: opts
   
    def call(conn, _) do
     case build_context(conn) do
      {:ok, context} ->
       put_private(conn, :absinthe, %{context: context})
      _ ->
       conn
     end
    end
   
    defp build_context(conn) do
     with ["Bearer " <> token] <- get_req_header(conn, "authorization"),
          {:ok, current_person} <- authorize(token) do
      {:ok, %{current_person: current_person, token: token}}
     end
    end
   
    defp authorize(token) do
       Person
       |> where(token: ^token)
       |> Repo.one()
     |> case do
          nil -> {:error, "Invalid authorization token"}
       person -> {:ok, person}
        end
    end
   end