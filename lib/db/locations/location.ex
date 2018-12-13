defmodule Db.Locations.Location do
  use Ecto.Schema
  use Timex.Ecto.Timestamps
  import Ecto.Changeset


  schema "locations" do
    field :address, :string
    field :address_full, :string
    field :city, :string
    field :country, :string
    field :lat, :float
    field :lon, :float
    field :state, :string
    field :zip, :string
    belongs_to :event, Db.Events.Event
    belongs_to :venue, Db.Venues.Venue

    timestamps(inserted_at: :created_at)
  end

  @doc false
  def changeset(location, attrs) do
    location
    |> cast(attrs, [:address, :address_full, :city, :country, :lat, :lon, :state, :zip, :event_id, :venue_id])
    #|> validate_required([:address, :address_full, :city, :country, :lat, :lon, :state, :zip])
  end
end
