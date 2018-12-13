defmodule Db.Persons.Session do
    alias Db.Persons.Person
    alias Db.Repo

    def authenticate(%{email: email, password: password}) do
        person = Repo.get_by(Person, email: email)
        case check_password(person, %{email: email, password: password}) do
            true -> {:ok, person}
            _ -> {:error, "Incorrect login credentials."}
        end
    end

    defp check_password(person, %{email: email, password: password}) do
        case person do
            nil -> Comeonin.Bcrypt.dummy_checkpw()
            _ -> Comeonin.Bcrypt.checkpw(password, person.hashed_password)
        end
    end
end