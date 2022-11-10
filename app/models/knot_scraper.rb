require "nokogiri"
require "pry"
require "httparty"

class Knot_Scraper
  url = ""
  knot_list = HTTParty.get(url)

  doc = Nokogiri::HTML(knot_list)

  binding.pry
end

knot_scraper = Knot_Scraper.new
