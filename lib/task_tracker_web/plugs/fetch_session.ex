defmodule TaskTrackerWeb.Plugs.FetchSession do
  import Plug.Conn

  def init(args), do: args

  def call(conn, _args) do
    user = TaskTracker.Users.get_user(get_session(conn, :user_id) || -1)
    subordinates = TaskTracker.Users.get_subordinates(get_session(conn, :user_id) || -1)
    if user do
      assign(conn, :current_user, user)
      |> assign(:current_subordinates, subordinates)
    else
      assign(conn, :current_user, nil)
      |> assign(:current_subordinates, nil)
    end
  end
end
