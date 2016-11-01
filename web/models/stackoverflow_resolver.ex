defmodule StackoverflowResolver do
  @moduledoc false

  def resolve(stackoverflow_id) do
    %{"quotes": questions(stackoverflow_id) ++ answers(stackoverflow_id)}
  end

  defp user(stackoverflow_id) do
    List.first(get("users/#{stackoverflow_id}", %{})["items"])
  end

  defp answers(stackoverflow_id) do
    get("users/#{stackoverflow_id}/answers", %{sort: "votes", page: 1, pagesize: 10, filter: "withbody"})["items"] |>
        Enum.map(fn(answer) -> %{icon: "https://goo.gl/NiD4Re", body: answer["body"]} end)
  end

  defp questions(stackoverflow_id) do
    get("users/#{stackoverflow_id}/questions", %{sort: "votes", page: 1, pagesize: 10, filter: "withbody"})["items"] |>
        Enum.map(fn(question) -> %{icon: "https://goo.gl/NiD4Re", body: question["body"]} end)
  end

  defp get(path, params) do
    parse(HTTPotion.get("https://api.stackexchange.com/2.2/#{path}",
        query: Map.merge(%{site: "stackoverflow",
                           key: Application.get_env(:dev_quotes, :stackoverflow_api_key)},
                         params)))
  end

  defp parse(response) do
    JSON.decode!(:zlib.gunzip(response.body))
  end
end
