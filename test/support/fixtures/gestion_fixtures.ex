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

  @doc """
  Generate a working_time.
  """
  def working_time_fixture(attrs \\ %{}) do
    {:ok, working_time} =
      attrs
      |> Enum.into(%{
        end: ~U[2023-10-23 14:28:00Z],
        start: ~U[2023-10-23 14:28:00Z]
      })
      |> Gotham.Gestion.create_working_time()

    working_time
  end
end
