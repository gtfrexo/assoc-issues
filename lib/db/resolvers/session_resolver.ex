defmodule Db.Session_Resolver do
    alias Db.Persons
    alias Db.Persons.Guardian

    #def login_user(_,%{input: input},_) do
    #    with {:ok, user <- Users.Session.authenticate{input}}, {:ok, jwt_token, _} <- Guardian.encode_and_sign(user) do
    #        {:ok, %{token: jwt_token, user: user}}
    #    end
    #   
    #end

    def login_person(_,%{email: email, password: password},_) do
       with {:ok, person} <- Persons.Session.authenticate(%{email: email, password: password}), 
                {:ok, jwt_token, _} <- Guardian.encode_and_sign(person), #do
                {:ok, _} <- Persons.Person.store_token(person, jwt_token) do
            {:ok, %{token: jwt_token, person: person}}
       end
    end

end