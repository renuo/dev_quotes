defmodule DevQuotes.BlogSourceAdapterTest do
  use ExUnit.Case, async: true
  alias DevQuotes.BlogSourceAdapter

  @blog_url "https://blog.fefe.de/"

  test "can download a blogs html" do
    assert BlogSourceAdapter.html(@blog_url) =~ "<title>Fefes Blog</title>"
  end

  test "can return text" do
    assert String.length(BlogSourceAdapter.random_text(@blog_url)) > 0
  end

  test "can find articles in html" do
    html = ~s(<article>sample</article>  otherstuff  <article>sample2</article>)
    assert BlogSourceAdapter.get_articles(html) == [{"article", [], ["sample"]}, {"article", [], ["sample2"]}]
  end

  test "can find links in articles" do
    html = ~s(<article>sample<a href="https://npl.ch">name</a>blub<a href="https://sr5.me">name</a></article>  other)
    assert BlogSourceAdapter.get_links(html) == ["https://npl.ch", "https://sr5.me"]
  end

  test "can find links in articles relocating on the same page or being whitelisted" do
    html = ~s(<article>
                sample <a href="/my-other-article">name</a>
                blub <a href="https://sr5.me">name</a>
                gach <a href="https://npl.ch">link</a>
              </article>  other)
    reference_url = "npl.ch"
    assert BlogSourceAdapter.get_local_links(html, reference_url) == ["https://npl.ch", "/my-other-article"]
  end
end
