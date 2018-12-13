defmodule Db.Repo.Migrations.CreateMedias do
  use Ecto.Migration

  def change do
    create table(:medias) do
      add :deleted_at, :utc_datetime
      add :description, :string
      add :media_type, :string
      add :url, :string

      timestamps(inserted_at: :created_at)
    end

  end
end
