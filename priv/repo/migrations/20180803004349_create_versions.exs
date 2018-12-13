defmodule Db.Repo.Migrations.CreateVersions do
  use Ecto.Migration

  def change do
    create table(:versions) do
      add :current_version, :string
      add :target_version, :string

      timestamps(inserted_at: :created_at)
    end

  end
end
