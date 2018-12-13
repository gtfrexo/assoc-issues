defmodule Db.Repo.Migrations.CreateServerFlags do
  use Ecto.Migration

  def change do
    create table(:server_flags) do
      add :version, :string
      add :release_notes, :string

      timestamps(inserted_at: :created_at)
    end

  end
end
