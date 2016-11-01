defmodule StackoverflowResolver do
  @moduledoc false

  def resolve(data_source) do
    %{"user": List.first(
        elem(JSON.decode(:zlib.gunzip(
                            HTTPotion.get("https://api.stackexchange.com/2.2/users/#{data_source.data}",
                                          query: %{site: "stackoverflow", key: "HtNWsT)iyWqWfTWuSZ*14g(("}).body)),
             1)["items"]),
      "answers":
         elem(JSON.decode(:zlib.gunzip(
                         HTTPotion.get("https://api.stackexchange.com/2.2/users/#{data_source.data}/answers",
                                       query: %{sort: "votes", site: "stackoverflow", key: data_source.key}).body)),
              1)["items"]}
  end
end
