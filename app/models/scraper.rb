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

    species_array = []

    species_list.each do |specie|
      #gets the actual url for each species
      url = specie.attributes["href"].value
      species_array << url
    end

    #removes links not associated with fish species
    9.times do
      species_array.pop
    end

    scrape_species_pages(species_array)
  end

  def scrape_species_pages(species_array)
  end
end

scrape = Scraper.new
scrape.scrape_species_urls
