require "nokogiri"
require "pry"
require "httparty"

class Knot_Scraper
  # def scrape_knot_urls
  url = "https://www.101knots.com/category/fishing-knots"
  knot_list = HTTParty.get(url)

  doc = Nokogiri::HTML(knot_list)

  knot_urls = []

  knots = doc.css(".columnthree").css("ul").css("li").css("a")

  knots.each do |knot|
    url = knot.attributes["href"].value
    knot_urls << url
  end

  binding.pry

  scrape_knot_pages(knot_urls)

  def scrape_knot_pages(knot_urls)
    knot_urls.each do |url|
      html = HTTParty.get(url)
      doc = Nokogiri::HTML(html)
    end
  end
end

knot_scraper = Knot_Scraper.new
