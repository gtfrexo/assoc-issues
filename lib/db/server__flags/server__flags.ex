defmodule Db.Server_Flags do
  @moduledoc """
  The Server_Flags context.
  """

  import Ecto.Query, warn: false
  alias Db.Repo

  alias Db.Server_Flags.Server_Flag

  @doc """
  Returns the list of server_flags.

  ## Examples

      iex> list_server_flags()
      [%Server_Flag{}, ...]

  """
  def list_server_flags do
    Repo.all(Server_Flag)
  end

  @doc """
  Gets a single server__flag.

  Raises `Ecto.NoResultsError` if the Server  flag does not exist.

  ## Examples

      iex> get_server__flag!(123)
      %Server_Flag{}

      iex> get_server__flag!(456)
      ** (Ecto.NoResultsError)

  """
  def get_server__flag!(id), do: Repo.get!(Server_Flag, id)

  @doc """
  Creates a server__flag.

  ## Examples

      iex> create_server__flag(%{field: value})
      {:ok, %Server_Flag{}}

      iex> create_server__flag(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_server__flag(attrs \\ %{}) do
    %Server_Flag{}
    |> Server_Flag.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a server__flag.

  ## Examples

      iex> update_server__flag(server__flag, %{field: new_value})
      {:ok, %Server_Flag{}}

      iex> update_server__flag(server__flag, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_server__flag(%Server_Flag{} = server__flag, attrs) do
    server__flag
    |> Server_Flag.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Server_Flag.

  ## Examples

      iex> delete_server__flag(server__flag)
      {:ok, %Server_Flag{}}

      iex> delete_server__flag(server__flag)
      {:error, %Ecto.Changeset{}}

  """
  def delete_server__flag(%Server_Flag{} = server__flag) do
    Repo.delete(server__flag)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking server__flag changes.

  ## Examples

      iex> change_server__flag(server__flag)
      %Ecto.Changeset{source: %Server_Flag{}}

  """
  def change_server__flag(%Server_Flag{} = server__flag) do
    Server_Flag.changeset(server__flag, %{})
  end
end
