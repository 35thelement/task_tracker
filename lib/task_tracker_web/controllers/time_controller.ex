defmodule TaskTrackerWeb.TimeController do
  use TaskTrackerWeb, :controller

  alias TaskTracker.Times
  alias TaskTracker.Times.Time

  def index(conn, _params) do
    times = Times.list_times()
    render(conn, "index.html", times: times)
  end

  def new(conn, _params) do
    changeset = Times.change_time(%Time{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"time" => time_params}) do
    case Times.create_time(time_params) do
      {:ok, time} ->
        conn
        |> put_flash(:info, "Time created successfully.")
        |> redirect(to: Routes.time_path(conn, :show, time))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    time = Times.get_time!(id)
    render(conn, "show.html", time: time)
  end

  def edit(conn, %{"id" => id}) do
    time = Times.get_time!(id)
    changeset = Times.change_time(time)
    render(conn, "edit.html", time: time, changeset: changeset)
  end

  def update(conn, %{"id" => id, "time" => time_params}) do
    time = Times.get_time!(id)

    case Times.update_time(time, time_params) do
      {:ok, time} ->
        conn
        |> put_flash(:info, "Time updated successfully.")
        |> redirect(to: Routes.time_path(conn, :show, time))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", time: time, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    time = Times.get_time!(id)
    {:ok, _time} = Times.delete_time(time)

    conn
    |> put_flash(:info, "Time deleted successfully.")
    |> redirect(to: Routes.time_path(conn, :index))
  end
end
