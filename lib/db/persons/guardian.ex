defmodule Db.Persons.Guardian do
    use Guardian, otp_app: :db
    alias Db.Persons
    def subject_for_token(person, _claims) do
      {:ok, to_string(person.id)}
    end
    def resource_from_claims(claims) do
      person = claims["sub"]
      |> Persons.get_person!
      {:ok, person}
      # If something goes wrong here return {:error, reason}
    end
  end