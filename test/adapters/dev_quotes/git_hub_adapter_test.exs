defmodule DevQuotes.GitHubAdapterTest do
  use ExUnit.Case, async: false
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  setup_all do
    HTTPoison.start
  end

  test "fetch the email address" do
    use_cassette "github_email_address", match_requests_on: [:query] do
      assert DevQuotes.GitHubAdapter.user_email("lukaselmer") ==
       "lukas.elmer@gmail.com"
    end
  end

  test "fetch the latest event" do
    use_cassette "github_events", match_requests_on: [:query] do
      assert DevQuotes.GitHubAdapter.latest_event("lukaselmer") == "lukaselmer pushed to renuo/dev_quotes, see <a href='https://github.com/renuo/dev_quotes/compare/e3a1cc66b008eaa0ea277f94f77e86b7536519e5...6ef6acd76d46f1828144ca064769257e72c72478'>here</a>"
    end
  end

  test "fetch the latest events" do
    use_cassette "github_events", match_requests_on: [:query] do
      events = DevQuotes.GitHubAdapter.latest_events("lukaselmer")
      assert((events |> List.first) == "lukaselmer pushed to renuo/dev_quotes, see <a href='https://github.com/renuo/dev_quotes/compare/e3a1cc66b008eaa0ea277f94f77e86b7536519e5...6ef6acd76d46f1828144ca064769257e72c72478'>here</a>")
      assert((events |> List.last) == "lukaselmer pushed to renuo/dev_quotes, see <a href='https://github.com/renuo/dev_quotes/compare/e3a1cc66b008eaa0ea277f94f77e86b7536519e5...6ef6acd76d46f1828144ca064769257e72c72478'>here</a>")
    end
  end
end
