defmodule TaskTrackerWeb.TimeController do
  use TaskTrackerWeb, :controller

  alias TaskTracker.Times
  alias TaskTracker.Times.Time
  alias TaskTracker.Tasks

  action_fallback TaskTrackerWeb.FallbackController

  def index(conn, _params) do
    times = Times.list_times()
    render(conn, "index.json", times: times)
  end

  def create(conn, %{"time" => time_params}) do
    task = Tasks.get_task!(Map.get(time_params, "task_id"))
    with {:ok, %Time{}} <- Times.create_time(time_params) do
      conn
      |> put_flash(:info, "You have started working on the task.")
      |> redirect(to: Routes.task_path(conn, :show, task))
    end
  end

  def show(conn, %{"id" => id}) do
    time = Times.get_time!(id)
    render(conn, "show.json", time: time)
  end

  def update(conn, %{"id" => id, "time" => time_params}) do
    time = Times.get_time!(id)

    with {:ok, %Time{} = time} <- Times.update_time(time, time_params) do
      render(conn, "show.json", time: time)
    end
  end

  def delete(conn, %{"id" => id}) do
    time = Times.get_time!(id)

    with {:ok, %Time{}} <- Times.delete_time(time) do
      conn
      |> redirect(to: Routes.user_path(conn, :index))
    end
  end
end
