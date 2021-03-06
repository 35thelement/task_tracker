defmodule TaskTracker.Users.User do
  use Ecto.Schema
  import Ecto.Changeset


  schema "users" do
    field :email, :string
    field :name, :string
    belongs_to :boss, TaskTracker.Users.User
    has_many :subordinates, TaskTracker.Users.User
    has_many :tasks, TaskTracker.Tasks.Task
    has_many :times, TaskTracker.Times.Time

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :email, :boss_id])
    |> validate_required([:name, :email])
  end
end
