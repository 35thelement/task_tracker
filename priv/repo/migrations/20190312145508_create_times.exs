defmodule TaskTracker.Repo.Migrations.CreateTimes do
  use Ecto.Migration

  def change do
    create table(:times) do
      add :start, :naive_datetime, null: false
      add :stop, :naive_datetime, null: false
      add :user_id, references(:users, on_delete: :delete_all), null: false
      add :task_id, references(:tasks, on_delete: :delete_all), null: false

      timestamps()
    end

    create index(:times, [:user_id])
    create index(:times, [:task_id])
  end
end
