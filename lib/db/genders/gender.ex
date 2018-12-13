defmodule Db.Genders.Gender do
  use Ecto.Schema
  use Timex.Ecto.Timestamps
  import Ecto.Changeset


  schema "genders" do
    field :is_female, :boolean, default: false
    field :is_male, :boolean, default: false
    belongs_to :person, Db.Persons.Person

    timestamps(inserted_at: :created_at)
  end

  @doc false
  def changeset(gender, attrs) do
    gender
    |> cast(attrs, [:is_male, :is_female, :person_id])
    #|> validate_required([:is_male, :is_female])
  end
end
