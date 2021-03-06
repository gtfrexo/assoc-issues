defmodule Db.Venues.Venue do
  use Ecto.Schema
  use Timex.Ecto.Timestamps
  import Ecto.Changeset


  schema "venues" do
    field :category, :string
    field :description, :string
    field :name, :string
    field :name_full, :string
    #belongs_to :event, Db.Events.Event
    has_one :location, Db.Locations.Location
    has_one :pic, Db.Medias.Media, foreign_key: :venue_image_id
    has_many :events, Db.Events.Event
    has_many :hosts, Db.Hosts.Host
    has_many :images, Db.Medias.Media, foreign_key: :venue_images_id

    timestamps(inserted_at: :created_at)
  end

  @doc false
  def changeset(venue, attrs) do
    venue
    |> cast(attrs, [:category, :description, :name, :name_full])
    #|> validate_required([:category, :description, :name, :name_full])
  end
end
