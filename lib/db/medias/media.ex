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
    belongs_to :venue_image, Db.Venues.Venue, foreign_key: :venue_image_id
    belongs_to :venue_images, Db.Venues.Venue, foreign_key: :venue_images_id
    belongs_to :event_image, Db.Events.Event, foreign_key: :event_image_id
    belongs_to :event_images, Db.Events.Event, foreign_key: :event_images_id
    belongs_to :person_image, Db.Persons.Person, foreign_key: :person_image_id
    belongs_to :person_images, Db.Persons.Person, foreign_key: :person_images_id

    timestamps(inserted_at: :created_at)
  end

  @doc false
  def changeset(media, attrs) do
    media
    |> cast(attrs, [:deleted_at, :description, :media_type, :url, :event_image_id, :event_images_id, :venue_image_id, :venue_images_id, :person_image_id, :person_images_id])
    #|> validate_required([:deleted_at, :description, :media_type, :url])
  end
end
