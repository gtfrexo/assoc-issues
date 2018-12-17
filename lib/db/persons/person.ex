defmodule Db.Persons.Person do
  use Ecto.Schema
  use Timex.Ecto.Timestamps
  import Ecto.Changeset
  alias Comeonin.Bcrypt


  schema "persons" do
    field :bio, :string
    field :birthday, :utc_datetime
    field :name, :string
    field :name_full, :string
    field :target_gender, :string
    field :target_relationship, :string
    field :email, :string
    field :password, :string
    field :hashed_password, :string
    field :token, :string
    field :current_device, :string
    field :current_n_key, :string
    has_one :gender, Db.Genders.Gender
    has_one :profile_content, Db.Profile_Contents.Profile_Content
    has_one :profile_pic, Db.Medias.Media, foreign_key: :person_image_id
    has_many :currently_blocking, Db.Persons.Person, foreign_key: :currently_blocking_id
    has_many :blocked_by, Db.Persons.Person, foreign_key: :blocked_by_id
    has_many :created_events, Db.Events.Event, foreign_key: :created_by_id
    has_many :sent_messages, Db.Messages.Message, foreign_key: :to_person_id
    has_many :received_messages, Db.Messages.Message, foreign_key: :from_person_id
    has_many :chatting_with, Db.Persons.Person, foreign_key: :chatting_with_id
    has_many :interested_pools, Db.Pools.Pool, foreign_key: :interested_persons_id
    has_many :viewed_pools, Db.Pools.Pool, foreign_key: :viewed_persons_id
    has_many :attending_pools, Db.Pools.Pool, foreign_key: :attending_persons_id
    has_many :images, Db.Medias.Media, foreign_key: :person_images_id
    has_many :deleted_events, Db.Events.Event, foreign_key: :deleted_by_id
    has_many :updated_events, Db.Events.Event, foreign_key: :updated_by_id
    #belongs_to :user, Db.Users.User
    has_many :logs, Db.Logs.Log

    timestamps(inserted_at: :created_at)
  end

  @doc false
  def changeset(person, attrs) do
    person
    |> cast(attrs, [:bio, :birthday, :name, :name_full, :target_gender, :target_relationship, :email, :password, :hashed_password, :current_device, :current_n_key])
    #|> Db.Repo.preload(:interested_pools)
    #|> cast_assoc(:interested_pools)
    #|> validate_required([:bio, :birthday, :name, :name_full, :target_gender, :target_relationship])
    |> put_pass_hash()
  end

  def store_token(%Db.Persons.Person{} = person, token) do
    person
    |> Db.Persons.Person.changeset(%{token: token})
    |> Db.Repo.update()
  end

  defp put_pass_hash(%Ecto.Changeset{valid?: true, changes: %{hashed_password: hashed_password}} = changeset) do
    change(changeset, hashed_password: Bcrypt.hashpwsalt(hashed_password))
  end

  defp put_pass_hash(changeset), do: changeset
end
