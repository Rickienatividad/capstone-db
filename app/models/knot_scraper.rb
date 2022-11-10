require "nokogiri"
require "pry"
require "httparty"

class Knot_Scraper
  url = "https://www.mossyoak.com/our-obsession/blogs/fishing/five-knots-every-fisherman-should-know"

  knot_list = HTTParty.get(url)

  doc = Nokogiri::HTML(knot_list)
  binding.pry
end

knot_scraper = Knot_Scraper.new
