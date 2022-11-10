require "nokogiri"
require "pry"
require "httparty"

class Knot_Scraper
  url = "https://www.fishingloft.com/fishing-knots.html"
  knot_list = HTTParty.get(url)

  doc = Nokogiri::HTML(knot_list)

  knots = doc.css("p").css("a").first(5)

  knot_urls = []
  knots.each do |knot|
    url = knot["href"]
    knot_urls << url
  end
  binding.pry
end

knot_scraper = Knot_Scraper.new
