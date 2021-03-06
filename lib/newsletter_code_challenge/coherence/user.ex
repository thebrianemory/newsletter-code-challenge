defmodule NewsletterCodeChallenge.Coherence.User do
  @moduledoc false
  use Ecto.Schema
  use Coherence.Schema

  

  schema "users" do
    field :name, :string, default: "Subscriber"
    field :email, :string
    field :role, :string, default: "subscriber"
    coherence_schema()

    timestamps()
  end

  def changeset(model, params \\ %{}) do
    model
    |> cast(params, [:name, :email, :role] ++ coherence_fields())
    |> validate_required([:name, :email])
    |> validate_format(:email, ~r/@/)
    |> unique_constraint(:email)
  end

  def changeset(model, params, :password) do
    model
    |> cast(params, ~w(password password_confirmation reset_password_token reset_password_sent_at))
    |> validate_coherence_password_reset(params)
  end

  # Used in iex to update an admin with a password so they can log in
  def admin_password_update(user, password) do
    hashed_password = Comeonin.Bcrypt.hashpwsalt(password)
    %{user | password_hash: hashed_password}
  end
end
