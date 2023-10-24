defmodule Gotham.GestionTest do
  use Gotham.DataCase

  alias Gotham.Gestion

  describe "clocks" do
    alias Gotham.Gestion.Clock

    import Gotham.GestionFixtures

    @invalid_attrs %{status: nil, time: nil}

    test "list_clocks/0 returns all clocks" do
      clock = clock_fixture()
      assert Gestion.list_clocks() == [clock]
    end

    test "get_clock!/1 returns the clock with given id" do
      clock = clock_fixture()
      assert Gestion.get_clock!(clock.id) == clock
    end

    test "create_clock/1 with valid data creates a clock" do
      valid_attrs = %{status: true, time: ~U[2023-10-23 14:10:00Z]}

      assert {:ok, %Clock{} = clock} = Gestion.create_clock(valid_attrs)
      assert clock.status == true
      assert clock.time == ~U[2023-10-23 14:10:00Z]
    end

    test "create_clock/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Gestion.create_clock(@invalid_attrs)
    end

    test "update_clock/2 with valid data updates the clock" do
      clock = clock_fixture()
      update_attrs = %{status: false, time: ~U[2023-10-24 14:10:00Z]}

      assert {:ok, %Clock{} = clock} = Gestion.update_clock(clock, update_attrs)
      assert clock.status == false
      assert clock.time == ~U[2023-10-24 14:10:00Z]
    end

    test "update_clock/2 with invalid data returns error changeset" do
      clock = clock_fixture()
      assert {:error, %Ecto.Changeset{}} = Gestion.update_clock(clock, @invalid_attrs)
      assert clock == Gestion.get_clock!(clock.id)
    end

    test "delete_clock/1 deletes the clock" do
      clock = clock_fixture()
      assert {:ok, %Clock{}} = Gestion.delete_clock(clock)
      assert_raise Ecto.NoResultsError, fn -> Gestion.get_clock!(clock.id) end
    end

    test "change_clock/1 returns a clock changeset" do
      clock = clock_fixture()
      assert %Ecto.Changeset{} = Gestion.change_clock(clock)
    end
  end
end
