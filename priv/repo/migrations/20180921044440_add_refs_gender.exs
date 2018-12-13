defmodule Db.Repo.Migrations.AddRefsGender do
  use Ecto.Migration

  def change do
    alter table("genders") do
      add :person_id, references(:persons, on_delete: :nothing)
    end
  end
end
