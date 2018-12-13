defmodule Db.Repo.Migrations.AddRefsVenue do
  use Ecto.Migration

  def change do
    alter table("venues") do
      add :event_id, references(:events, on_delete: :nothing)
    end
  end
end
