defmodule SimpleChatServer.Repo.Migrations.CreateRooms do
  use Ecto.Migration

  def change do
    create table(:rooms) do
      add :desc, :text
      add :name, :string

      timestamps()
    end

    create unique_index(:rooms, [:name])
  end
end
