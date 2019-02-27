defmodule TaskTrackerWeb.TimeControllerTest do
  use TaskTrackerWeb.ConnCase

  alias TaskTracker.Times

  @create_attrs %{minutes: 42}
  @update_attrs %{minutes: 43}
  @invalid_attrs %{minutes: nil}

  def fixture(:time) do
    {:ok, time} = Times.create_time(@create_attrs)
    time
  end

  describe "index" do
    test "lists all times", %{conn: conn} do
      conn = get(conn, Routes.time_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Times"
    end
  end

  describe "new time" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.time_path(conn, :new))
      assert html_response(conn, 200) =~ "New Time"
    end
  end

  describe "create time" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.time_path(conn, :create), time: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.time_path(conn, :show, id)

      conn = get(conn, Routes.time_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Time"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.time_path(conn, :create), time: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Time"
    end
  end

  describe "edit time" do
    setup [:create_time]

    test "renders form for editing chosen time", %{conn: conn, time: time} do
      conn = get(conn, Routes.time_path(conn, :edit, time))
      assert html_response(conn, 200) =~ "Edit Time"
    end
  end

  describe "update time" do
    setup [:create_time]

    test "redirects when data is valid", %{conn: conn, time: time} do
      conn = put(conn, Routes.time_path(conn, :update, time), time: @update_attrs)
      assert redirected_to(conn) == Routes.time_path(conn, :show, time)

      conn = get(conn, Routes.time_path(conn, :show, time))
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, time: time} do
      conn = put(conn, Routes.time_path(conn, :update, time), time: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Time"
    end
  end

  describe "delete time" do
    setup [:create_time]

    test "deletes chosen time", %{conn: conn, time: time} do
      conn = delete(conn, Routes.time_path(conn, :delete, time))
      assert redirected_to(conn) == Routes.time_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.time_path(conn, :show, time))
      end
    end
  end

  defp create_time(_) do
    time = fixture(:time)
    {:ok, time: time}
  end
end
