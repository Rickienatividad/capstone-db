require "nokogiri"
require "httparty"
# require "pry"

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
    fresh_species = []

    species_array.each do |specie|
      url = "https://www.dnr.sc.gov/#{specie}"
      html = HTTParty.get(url)
      doc = Nokogiri::HTML(html)

      name = doc.css("#leftcolumn").at_css(".whitebck").css("h2").text

      description = doc.css("#leftcolumn").at_css(".whitebck").at_css("p").text

      length = doc.css("#leftcolumn").search("div")[1].search("p")[2].text

      weight = doc.css("#leftcolumn").search("div")[1].search("p")[3].text

      habits = doc.css("#leftcolumn").search("div")[3].css("ul").css("li").text

      img_url = doc.css("#rightcolumn").at_css(".backwhite").css("a").first["href"]
      img = "https://www.dnr.sc.gov/fish/species/#{img_url}"

      species_info = {
        name: name,
        description: description,
        length: length,
        weight: weight,
        habits: habits,
        img: img,
      }

      fresh_species << species_info
    end
    fresh_species
  end
end

scrape = Scraper.new
scrape.scrape_species_urls
