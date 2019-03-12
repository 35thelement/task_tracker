defmodule TaskTracker.Times.Time do
  use Ecto.Schema
  import Ecto.Changeset


  schema "times" do
    field :start, :naive_datetime
    field :stop, :naive_datetime
    belongs_to :user, TaskTracker.Users.User
    belongs_to :task, TaskTracker.Tasks.Task

    timestamps()
  end

  @doc false
  def changeset(time, attrs) do
    time
    |> cast(attrs, [:start, :stop, :user_id, :task_id])
    |> validate_required([:start, :user_id, :task_id])
  end
end
