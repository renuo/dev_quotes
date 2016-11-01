defmodule DevQuotes.BlogSourceAdapterTest do
  use ExUnit.Case, async: true
  alias DevQuotes.BlogSourceAdapter

  @blog_url "https://blog.fefe.de/"

  test "can download a blogs html" do
    assert BlogSourceAdapter.html(@blog_url) =~ "<title>Fefes Blog</title>"
  end

  test "can parse blog html" do
    assert length(BlogSourceAdapter.entries(@blog_url)) > 0
  end
end
