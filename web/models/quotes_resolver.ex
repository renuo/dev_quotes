defmodule QuotesResolver do
  @moduledoc false

  def resolve(data_source) do
    case {data_source.type} do
      {"stackoverflow"} ->
        DevQuotes.StackoverflowAdapter.resolve(data_source.data)
      {"twitter"} ->
        DevQuotes.TwitterAdapter.resolve(data_source.data)
      {"github"} ->
        DevQuotes.GitHubAdapter.latest_event(data_source.data)
    end
  end
end
