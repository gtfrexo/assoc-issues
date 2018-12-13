defmodule Db.Server_Flags.Server_Flag do
  use Ecto.Schema
  use Timex.Ecto.Timestamps
  import Ecto.Changeset


  schema "server_flags" do
    field :release_notes, :string
    field :version, :string

    timestamps(inserted_at: :created_at)
  end

  @doc false
  def changeset(server__flag, attrs) do
    server__flag
    |> cast(attrs, [:version, :release_notes])
    #|> validate_required([:version, :release_notes])
  end
end
