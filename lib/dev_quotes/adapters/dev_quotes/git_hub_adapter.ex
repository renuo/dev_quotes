defmodule DevQuotes.GitHubAdapter do
  def user_email(username) do
    Tentacat.Users.find(username, client) |> Map.get("email")
  end

  def latest_event(username) do
    events = Tentacat.Users.Events.list(username, client)
    event = Enum.find(events, fn(x) -> convertable_event?(x) end)

    repo = event["repo"]["name"]
    body = "#{username} pushed to #{repo}, see <a href='#{extract_link(event)}'>here</a>"
    %{"quotes": [%{icon: "https://goo.gl/AK5zl7", body: body}]}
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
