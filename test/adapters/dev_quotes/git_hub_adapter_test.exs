defmodule DevQuotes.GitHubAdapterTest do
  @moduledoc false

  use ExUnit.Case, async: true

  test "fetch the email address" do
    assert DevQuotes.GitHubAdapter.user_email("lukaselmer") ==
     "lukas.elmer@gmail.com"
  end

  test "fetch the latest event" do
    assert DevQuotes.GitHubAdapter.latest_event("lukaselmer") =~ "lukaselmer pushed to"
    # TODO: mock http backend, so we can do: assert DevQuotes.GitHubAdapter.latest_event("lukaselmer") == "lukaselmer pushed to renuo/dev_quotes, see <a href='https://github.com/renuo/dev_quotes/compare/502e6161e0d1195aa4773d4d960f9f73a1a4efbe...e143abea0a302413b58c4bf239006429ee4037a6'>here</a>"
  end
end
