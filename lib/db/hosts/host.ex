defmodule Db.Hosts.Host do
  use Ecto.Schema
  use Timex.Ecto.Timestamps
  import Ecto.Changeset


  schema "hosts" do
    field :description, :string
    field :name, :string
    field :name_full, :string
    belongs_to :event, Db.Events.Event
    belongs_to :venue, Db.Venues.Venue

    timestamps(inserted_at: :created_at)
  end

  @doc false
  def changeset(host, attrs) do
    host
    |> cast(attrs, [:description, :name, :name_full, :event_id, :venue_id])
    #|> validate_required([:description, :name, :name_full])
  end
end
