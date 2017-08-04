defmodule NewsletterCodeChallenge.Repo.Migrations.CreateCoherenceUser do
  use Ecto.Migration
  def change do
    create table(:users) do

      add :name, :string, default: "Subscriber"
      add :email, :string
      # authenticatable
      add :password_hash, :string
      # unlockable_with_token
      add :unlock_token, :string
      # confirmable
      add :confirmation_token, :string
      add :confirmed_at, :utc_datetime
      add :confirmation_sent_at, :utc_datetime
      
      timestamps()
    end
    create unique_index(:users, [:email])

  end
end
