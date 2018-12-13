defmodule Db.Logs.Log do
  use Ecto.Schema
  import Ecto.Changeset
  use Timex.Ecto.Timestamps 

  schema "logs" do
    field :category, Db.Logs.Category
    field :content, :string
    field :context, :string
    belongs_to :person, Db.Persons.Person
    

    timestamps(inserted_at: :created_at)
  end

  @doc false
  def changeset(log, attrs) do
    log
    |> cast(attrs, [:content, :context, :category, :person_id])
    #|> validate_required([:content, :context, :category])
  end
end
