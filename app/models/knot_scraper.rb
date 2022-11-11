require "nokogiri"
# require "pry"
require "httparty"

class KnotScraper
  def scrape_knot_link
    url = "https://www.101knots.com/category/fishing-knots"
    knot_list = HTTParty.get(url)

    doc = Nokogiri::HTML(knot_list)

    knot_urls = []

    knots = doc.css(".columnthree").css("ul").css("li").css("a")

    knots.each do |knot|
      url = knot.attributes["href"].value
      knot_urls << url
    end

    scrape_knot_pages(knot_urls)
  end

  def scrape_knot_pages(knot_urls)
    knot_list = []

    knot_urls.each do |url|
      html = HTTParty.get(url)
      doc = Nokogiri::HTML(html)

      name = doc.css(".body_head").css("h1").text

      img = doc.css(".aligncenter").css("a").attr("href").value

      knot_info = {
        name: name,
        img: img,
      }
      knot_list << knot_info
    end
    knot_list
  end
end

knot_scraper = KnotScraper.new
knot_scraper.scrape_knot_link
