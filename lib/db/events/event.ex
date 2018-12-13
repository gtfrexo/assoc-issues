defmodule Db.Events.Event do
  use Ecto.Schema
  use Timex.Ecto.Timestamps
  import Ecto.Changeset


  schema "events" do
    field :category, :string
    field :description, :string
    field :end_time, :utc_datetime
    field :start_time, :utc_datetime
    field :title, :string
    field :title_full, :string
    belongs_to :created_by, Db.Persons.Person
    belongs_to :venue, Db.Venues.Venue
    has_one :location, Db.Locations.Location
    has_one :pic, Db.Medias.Media
    has_one :pool, Db.Pools.Pool
    has_one :host, Db.Hosts.Host
    has_many :images, Db.Medias.Media
    has_many :venues, Db.Venues.Venue
    field :is_private, :boolean
    belongs_to :deleted_by, Db.Persons.Person
    belongs_to :updated_by, Db.Persons.Person

    timestamps(inserted_at: :created_at)
  end

  @doc false
  def changeset(event, attrs) do
    event
    |> cast(attrs, [:category, :description, :start_time, :end_time, :title, :title_full, :created_by_id, :venue_id, :is_private, :deleted_by, :updated_by])
    #|> validate_required([:category, :description, :start_time, :end_time, :title, :title_full])
  end
end
