defmodule TaskTracker.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add :name, :string
      add :desc, :text
      add :user_id, references(:users, on_delete: :delete_all), null: false
      add :done, :boolean, default: false, null: false

      timestamps()
    end

  end
end
