defmodule Db.Pools.Pool do
  use Ecto.Schema
  use Timex.Ecto.Timestamps
  import Ecto.Changeset


  schema "pools" do
    field :eventbrite_id, :string
    field :seatgeek_id, :string
    belongs_to :event, Db.Events.Event
    belongs_to :interested_persons, Db.Persons.Person
    belongs_to :attending_persons, Db.Persons.Person
    belongs_to :viewed_persons, Db.Persons.Person

    timestamps(inserted_at: :created_at)
  end

  @doc false
  def changeset(pool, attrs) do
    pool
    |> cast(attrs, [:eventbrite_id, :seatgeek_id, :event_id, :interested_persons_id, :attending_persons_id, :viewed_persons_id])
    #|> validate_required([:eventbrite_id, :seatgeek_id])
  end
end
