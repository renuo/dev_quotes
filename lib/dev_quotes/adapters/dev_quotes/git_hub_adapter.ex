defmodule DevQuotes.GitHubAdapter do
  def user_email(username) do
    Tentacat.Users.find(username, client) |> Map.get("email")
  end

  def resolve(username) do
    latest_events(username)
      |> Enum.map(fn(x) -> %{icon: "https://goo.gl/AK5zl7", body: x} end)
  end

  def convert_event(username, event) do
    repo = event["repo"]["name"]
    "#{username} pushed to #{repo}, see <a href='#{extract_link(event)}'>here</a>"
  end

  def latest_events(username) do
    Tentacat.Users.Events.list(username, client)
      |> Enum.filter(fn(x) -> convertable_event?(x) end)
      |> Enum.map(fn(x) -> convert_event(username, x) end)
  end

  def latest_event(username) do
    latest_events(username) |> List.first
  end

  defp extract_link(event) do
    repo = event["repo"]["name"]
    before = event["payload"]["before"]
    head = event["payload"]["head"]
    "https://github.com/#{repo}/compare/#{before}...#{head}"
  end

  defp convertable_event?(event) do
    Map.fetch!(event, "type") == "PushEvent"
  end

  defp client do
    token = Application.fetch_env!(:dev_quotes, :github_access_token)
    Tentacat.Client.new(%{access_token: token})
  end
end
