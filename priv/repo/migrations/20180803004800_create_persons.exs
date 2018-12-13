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

      timestamps(inserted_at: :created_at)
    end

  end
end
