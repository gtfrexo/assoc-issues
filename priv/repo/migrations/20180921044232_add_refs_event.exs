defmodule Db.Repo.Migrations.AddRefsEvent do
  use Ecto.Migration

  def change do
    alter table("events") do
      add :created_by_id, references(:persons, on_delete: :nothing)
      add :venue_id, references(:venues, on_delete: :nothing)
      add :deleted_by_id, references(:persons, on_delete: :nothing)
      add :updated_by_id, references(:persons, on_delete: :nothing)
    end
    create index(:events, [:created_by_id])
    create index(:events, [:deleted_by_id])
    create index(:events, [:updated_by_id])
  end
end
