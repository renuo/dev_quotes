defmodule DevQuotes.BlogSourceAdapter do
  def random_text(blog_url) do
    page_body = html(blog_url)

    #articles = get_articles(page_body)
    #links = get_local_links(page_body, blog_url)

    text = Floki.find(page_body, "li")
    |> Floki.raw_html
    |> HtmlSanitizeEx.strip_tags

    # TODO: out of bound
    start_point = :rand.uniform(String.length(text)) - 50
    end_point = start_point + 50

    String.slice(text, start_point..end_point)
  end

  def html(blog_url) do
    HTTPotion.get(blog_url).body
  end

  def get_articles(html) do
    html
    |> Floki.find("article")
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


