defmodule DataSourceResolver do
  @moduledoc false

  def resolve(data_source) do
    case {data_source.type} do
      {"stackoverflow"} ->
        StackoverflowResolver.resolve(data_source)
    end
  end
end
