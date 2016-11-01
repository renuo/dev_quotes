defmodule StackoverflowResolver do
  @moduledoc false

  def resolve(stackoverflow_id) do
    %{"user": user(stackoverflow_id),
      "answers": answers(stackoverflow_id)}
  end

  defp user(stackoverflow_id) do
    List.first(get("users/#{stackoverflow_id}", %{})["items"])
  end

  defp answers(stackoverflow_id) do
    get("users/#{stackoverflow_id}/answers", %{sort: "votes", page: 1, pagesize: 10, filter: "withbody"})["items"]
  end

  defp get(path, params) do
    parse(HTTPotion.get("https://api.stackexchange.com/2.2/#{path}",
        query: Map.merge(%{site: "stackoverflow",
                           key: Application.get_env(:dev_quotes, :stackoverflow_api_key)},
                         params)))
  end

  defp parse(response) do
    elem(JSON.decode(:zlib.gunzip(response.body)), 1)
  end
end
