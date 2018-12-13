defmodule Db.Repo.Migrations.AddRefsProfileContent do
  use Ecto.Migration

  def change do
    alter table("profile_contents") do
      add :person_id, references(:persons, on_delete: :nothing)
    end
  end
end
