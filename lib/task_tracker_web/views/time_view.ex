defmodule TaskTrackerWeb.TimeView do
  use TaskTrackerWeb, :view
  alias TaskTrackerWeb.TimeView

  def render("index.json", %{times: times}) do
    %{data: render_many(times, TimeView, "time.json")}
  end

  def render("show.json", %{time: time}) do
    %{data: render_one(time, TimeView, "time.json")}
  end

  def render("time.json", %{time: time}) do
    %{id: time.id,
      start: time.start,
      stop: time.stop}
  end
end
