defmodule Db.Medias.Media do
  use Ecto.Schema
  use Timex.Ecto.Timestamps
  import Ecto.Changeset


  schema "medias" do
    #field :created_at, :utc_datetime
    field :deleted_at, :utc_datetime
    field :description, :string
    field :media_type, :string
    field :url, :string
    belongs_to :venue, Db.Venues.Venue
    belongs_to :venue_media, Db.Venues.Venue
    belongs_to :event, Db.Events.Event
    belongs_to :event_media, Db.Events.Event
    belongs_to :person, Db.Persons.Person
    belongs_to :person_media, Db.Persons.Person

    timestamps(inserted_at: :created_at)
  end

  @doc false
  def changeset(media, attrs) do
    media
    |> cast(attrs, [:deleted_at, :description, :media_type, :url, :event_id, :event_media_id, :venue_id, :venue_media_id, :person_id, :person_media_id])
    #|> validate_required([:deleted_at, :description, :media_type, :url])
  end
end
