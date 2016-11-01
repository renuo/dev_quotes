defmodule DevQuotes.TwitterAdapter do
  @moduledoc false

  def resolve(twitter_screen_name) do
    IO.puts "resolving twitter for #{twitter_screen_name}"
    %{"quotes": tweets(twitter_screen_name)}
  end

  defp tweets(twitter_screen_name) do
    ExTwitter.search("from:@#{twitter_screen_name}", [count: 10]) |>
    Enum.map(fn(tweet) -> %{icon: "https://goo.gl/qxs3ZY", body: tweet.text} end)
  end
end
