defmodule Db.Repo.Migrations.AddRefsLocation do
  use Ecto.Migration

  def change do
    alter table("locations") do
      add :event_id, references(:events, on_delete: :nothing)
      add :venue_id, references(:venues, on_delete: :nothing)
    end
  end
end
