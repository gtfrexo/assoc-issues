defmodule Db.Messages.Message do
  use Ecto.Schema
  use Timex.Ecto.Timestamps
  import Ecto.Changeset


  schema "messages" do
    field :content, :string
    field :read_at, :utc_datetime
    field :sent_at, :utc_datetime
    belongs_to :from_person, Db.Persons.Person, foreign_key: :from_person_id
    belongs_to :to_person, Db.Persons.Person, foreign_key: :to_person_id

    timestamps(inserted_at: :created_at)
  end

  @doc false
  def changeset(message, attrs) do
    message
    |> cast(attrs, [:content, :read_at, :sent_at, :from_person_id, :to_person_id])
    #|> validate_required([:content, :read_at, :sent_at])
  end
end
