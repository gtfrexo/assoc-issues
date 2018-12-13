defmodule DbWeb.UserSocket do
  use Phoenix.Socket
  use Absinthe.Phoenix.Socket, schema: DbWeb.Schema

  ## Channels

  ## Transports
  transport :websocket, Phoenix.Transports.WebSocket,
    timeout: 45_000
  
  def connect(_params, socket) do
    socket = Absinthe.Phoenix.Socket.put_schema(socket, DbWeb.Schema)
    #current_person = current_person(params)
    #socket = Absinthe.Phoenix.Socket.put_opts(socket, context: %{
     # current_person: current_person
    #})
    {:ok, socket}
  end

  #defp current_person(%{"person" => id}) do
   # Db.Repo.get(Db.Persons.Person, id)
    #Db.Persons.get_person!(id)
  #end

  # Returning `nil` makes this socket anonymous.
  def id(_socket), do: nil
end
