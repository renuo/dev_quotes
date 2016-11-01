defmodule DevQuotes.BlogSourceAdapter do
  def entries(blog_url) do
    page_body = html(blog_url)


    #articles = get_articles(page_body)
    #links = get_local_links(page_body, blog_url)

    [html(blog_url)]
  end

  def html(blog_url) do
    HTTPotion.get(blog_url).body
  end

  def get_articles(html) do
    Floki.find(html, "article")
  end

  def get_links(html) do
    html
    |> Floki.find("article a")
    |> Floki.attribute("href")
  end

  def get_local_links(html, reference_url) do
    allowed_links = for n <- get_links(html), String.contains?(n, reference_url), do: n
    local_links = for n <- get_links(html), !String.starts_with?(n, "http"), do: n
    allowed_links ++ local_links
  end

  def crawl_links(links) do
    Enum.map(links, fn(url) -> HTTPotion.get!(url) end)
  end
end


