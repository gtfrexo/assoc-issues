defmodule Db.Repo.Migrations.AddRefsMedia do
  use Ecto.Migration

  def change do
    alter table("medias") do
      add :venue_id, references(:venues, on_delete: :nothing)
      add :venue_media_id, references(:venues, on_delete: :nothing)
      add :event_id, references(:events, on_delete: :nothing)
      add :event_media_id, references(:events, on_delete: :nothing)
      add :person_id, references(:persons, on_delete: :nothing)
      add :person_media_id, references(:persons, on_delete: :nothing)
    end
  end
end
