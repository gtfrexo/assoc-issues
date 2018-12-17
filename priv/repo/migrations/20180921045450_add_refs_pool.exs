defmodule Db.Repo.Migrations.AddRefsPool do
  use Ecto.Migration

  def change do
    alter table("pools") do
      add :event_id, references(:events, on_delete: :nothing)
      add :viewed_persons_id, references(:persons, on_delete: :nothing)
      add :interested_persons_id, references(:persons, on_delete: :nothing)
      add :attending_persons_id, references(:persons, on_delete: :nothing)
    end
    create index(:pools, [:viewed_persons_id])
    create index(:pools, [:interested_persons_id])
    create index(:pools, [:attending_persons_id])
  end
end
