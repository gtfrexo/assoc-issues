defmodule Db.Profile_Contents.Profile_Content do
  use Ecto.Schema
  use Timex.Ecto.Timestamps
  import Ecto.Changeset


  schema "profile_contents" do
    field :animal_blurb, :string
    field :boat_blurb, :string
    field :education_blurb, :string
    field :eggs_blurb, :string
    field :emoji_blurb, :string
    field :occupation_blurb, :string
    field :worst_pickup_blurb, :string
    belongs_to :person, Db.Persons.Person

    timestamps(inserted_at: :created_at)
  end

  @doc false
  def changeset(profile__content, attrs) do
    profile__content
    |> cast(attrs, [:animal_blurb, :boat_blurb, :education_blurb, :eggs_blurb, :emoji_blurb, :occupation_blurb, :worst_pickup_blurb, :person_id])
    #|> validate_required([:animal_blurb, :boat_blurb, :education_blurb, :eggs_blurb, :emoji_blurb, :occupation_blurb, :worst_pickup_blurb])
  end
end
