defmodule GothamWeb.UserJSON do
  alias Gotham.Gestion.User

  @doc """
  Renders a list of users.
  """
  def index(%{users: users}) do
    for(user <- users, do: data(user))
  end

  @doc """
  Renders a single user.
  """
  def show(%{user: user}) do
    data(user)
  end

  defp data(%User{} = user) do
    %{
      id: user.id,
      email: user.email,
      username: user.username
    }
  end
end
