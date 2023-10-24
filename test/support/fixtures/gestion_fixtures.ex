defmodule Gotham.GestionFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Gotham.Gestion` context.
  """

  @doc """
  Generate a clock.
  """
  def clock_fixture(attrs \\ %{}) do
    {:ok, clock} =
      attrs
      |> Enum.into(%{
        status: true,
        time: ~U[2023-10-23 14:10:00Z]
      })
      |> Gotham.Gestion.create_clock()

    clock
  end
end
