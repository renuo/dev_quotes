defmodule StackoverflowResolver do
  @moduledoc false

  def resolve(data_source) do
    %{"user": List.first(get("users/#{data_source.data}", %{})["items"]),
      "answers": get("users/#{data_source.data}/answers", %{sort: "votes"})["items"]}
  end

  defp get(path, params) do
    parse(HTTPotion.get("https://api.stackexchange.com/2.2/#{path}",
        query: Map.merge(%{site: "stackoverflow", key: Application.get_env(:dev_quotes, :stackoverflow_api_key)}, params)))
  end

  defp parse(response) do
    elem(JSON.decode(:zlib.gunzip(response.body)), 1)
  end
end
