defmodule DevQuotes.BlogSourceAdapter do
  import Phoenix.HTML

  def entries(blog_url) do
    page = html(blog_url)

    [html(blog_url)]
  end

  def html(blog_url) do
    HTTPotion.get(blog_url).body
  end
end
