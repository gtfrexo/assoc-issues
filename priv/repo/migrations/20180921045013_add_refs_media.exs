defmodule Db.Repo.Migrations.AddRefsMedia do
  use Ecto.Migration

  def change do
    alter table("medias") do
      add :venue_image_id, references(:venues, on_delete: :nothing)
      add :venue_images_id, references(:venues, on_delete: :nothing)
      add :event_image_id, references(:events, on_delete: :nothing)
      add :event_images_id, references(:events, on_delete: :nothing)
      add :person_image_id, references(:persons, on_delete: :nothing)
      add :person_images_id, references(:persons, on_delete: :nothing)
    end
    create index(:medias, [:person_image_id])
    create index(:medias, [:person_images_id])
    create index(:medias, [:event_image_id])
    create index(:medias, [:event_images_id])
    create index(:medias, [:venue_image_id])
    create index(:medias, [:venue_images_id])
  end
end
