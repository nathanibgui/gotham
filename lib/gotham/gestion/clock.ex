defmodule Gotham.Gestion.Clock do
  use Ecto.Schema
  import Ecto.Changeset

  schema "clocks" do
    field :status, :boolean, default: false
    field :time, :utc_datetime

    belongs_to :user, Gotham.Gestion.User

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(clock, attrs) do
    clock
    |> cast(attrs, [:time, :status, :user_id])
    |> validate_required([:time, :status, :user_id])
    |> validate_inclusion(:status, [true], message: "must be true when clocking in")
  end
end
