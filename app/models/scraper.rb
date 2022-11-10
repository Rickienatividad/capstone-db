require "nokogiri"
require "httparty"
require "pry"

class Scraper
  def scrape_species_urls
    #base url for list of species
    dnr_list = "https://www.dnr.sc.gov/freshwater.html"
    html = HTTParty.get(dnr_list)
    doc = Nokogiri::HTML(html)

    species_list = doc.css("#mainContent").css("ul").css("li").css("a")

    species_list.each do |specie|
      url = specie.attributes["href"].value
      binding.pry
    end
  end
end

scrape = Scraper.new
scrape.scrape_species_urls
