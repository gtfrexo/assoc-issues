defmodule Db.Repo.Migrations.CreateVenues do
  use Ecto.Migration

  def change do
    create table(:venues) do
      add :category, :string
      add :description, :string
      add :name, :string
      add :name_full, :string

      timestamps(inserted_at: :created_at)
    end

  end
end
