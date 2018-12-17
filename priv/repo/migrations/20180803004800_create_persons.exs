defmodule Db.Repo.Migrations.CreatePersons do
  use Ecto.Migration

  def change do
    create table(:persons) do
      add :bio, :string
      add :birthday, :utc_datetime
      add :name, :string
      add :name_full, :string
      add :target_gender, :string
      add :target_relationship, :string
      add :email, :string
      add :password, :string
      add :hashed_password, :string
      add :token, :string
      add :current_device, :string
      add :current_n_key, :string
      add :currently_blocking_id, references(:persons, on_delete: :nothing)
      add :blocked_by_id, references(:persons, on_delete: :nothing)
      add :chatting_with_id, references(:persons, on_delete: :nothing)

      timestamps(inserted_at: :created_at)
    end
    create index(:persons, [:currently_blocking_id])
    create index(:persons, [:blocked_by_id])
    create index(:persons, [:chatting_with_id])
  end
end
