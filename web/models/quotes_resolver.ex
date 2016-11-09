defmodule QuotesResolver do
  @moduledoc false

  def resolve(user) do
    DevQuotes.StackoverflowAdapter.resolve(user.stackoverflow_id) ++
    DevQuotes.TwitterAdapter.resolve(user.twitter_id) ++
    DevQuotes.GitHubAdapter.resolve(user.github_id) ++
    DevQuotes.BlogSourceAdapter.resolve(user.blog_url)
  end
end
