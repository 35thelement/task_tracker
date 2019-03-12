defmodule TaskTracker.Tasks.Task do
  use Ecto.Schema
  import Ecto.Changeset


  schema "tasks" do
    field :desc, :string
    field :done, :boolean, default: false
    field :name, :string
    belongs_to :user, TaskTracker.Users.User
    has_many :times, TaskTracker.Times.Time

    timestamps()
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:name, :desc, :done, :user_id])
    |> validate_required([:name, :desc, :done, :user_id])
  end
end
