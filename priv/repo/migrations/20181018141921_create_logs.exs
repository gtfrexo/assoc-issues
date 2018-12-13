defmodule Db.Repo.Migrations.CreateLogs do
  use Ecto.Migration

  def change do
    create table(:logs) do
      add :content, :string
      add :context, :string
      add :category, :string
      add :person_id, references(:persons, on_delete: :nothing)

      timestamps(inserted_at: :created_at)
    end

  end
end
