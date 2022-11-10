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
    species_array.each do |specie|
      url = "https://www.dnr.sc.gov/#{specie}"
      html = HTTParty.get(url)
      doc = Nokogiri::HTML(html)

      name = doc.css("#leftcolumn").at_css(".whitebck").css("h2").text

      description = doc.css("#leftcolumn").at_css(".whitebck").at_css("p").text

      length = doc.css("#leftcolumn").search("div")[1].search("p")[2].text

      weight = doc.css("#leftcolumn").search("div")[1].search("p")[3].text

      binding.pry
    end
  end
end

scrape = Scraper.new
scrape.scrape_species_urls
