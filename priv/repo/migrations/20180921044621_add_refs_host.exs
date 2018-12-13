defmodule Db.Repo.Migrations.AddRefsHost do
  use Ecto.Migration

  def change do
    alter table("hosts") do
      add :event_id, references(:events, on_delete: :nothing)
      add :venue_id, references(:venues, on_delete: :nothing)
    end
  end
end
