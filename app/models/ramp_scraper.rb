require "httparty"
require "nokogiri"
require "open-uri"
# require "pry"

class RampScraper
  def scrape_lake_list
    url = "https://www.dnr.sc.gov/lakes/search.html"
    html = HTTParty.get(url)
    doc = Nokogiri::HTML(html)

    lakes = doc.css(".twoColumn").css("table")[0].css("ul").css("li").css("a")

    lake_array = []
    lakes.each do |lake|
      lake = lake.attributes["href"].value
      lake_url = "https://www.dnr.sc.gov/lakes/" + lake
      lake_array << lake_url
    end
    lake_array.shift
    scrape_urls(lake_array)
  end

  def scrape_urls(lake_array)
    ramp_list = []
    lake_array.each do |lake|
      html = HTTParty.get(lake)
      doc = Nokogiri::HTML(html)

      ramps = doc.css(".twoColumn").css("strong")[5].css("a")
      ramp_list << ramps
    end
    url_list = []
    ramp_list.each do |ramp|
      url = ramp.attr("href")
      url_list << url
      url_list.delete(nil)
    end
    link_list = []
    url_list.each do |url|
      link = url.value
      link_list << link
    end
    link_list.delete_at(4)
    link_list.pop
    boat_ramps(link_list)
  end

  def boat_ramps(link_list)
    boat_ramps_list = []

    link_list.each do |link|
      html = URI.open(link)
      doc = Nokogiri::HTML(html)
      ramp_list = doc.css("table").css("tbody").css("td").css("a").attr("href").value

      ramp_list = "https://www2.dnr.sc.gov/" + ramp_list
      boat_ramps_list << ramp_list
    end

    coordinates(boat_ramps_list)
  end

  def coordinates(boat_ramps_list)
    ramp_info = []

    boat_ramps_list.each do |ramp|
      html = URI.open(ramp)
      doc = Nokogiri::HTML(html)

      latitude = doc.css("#leftcolumn").css("div")[2].text[/\Latitude: \d{2}\.\d{5}/]
      if latitude != nil
        latitude = latitude.delete "Latitude: "
        latitude = latitude.to_f
      end

      longitude = doc.css("#leftcolumn").css("div")[2].text[/\Longitude:\-\d{2}\.\d{5}/]
      if longitude != nil
        longitude = longitude.delete "Longitude:"
        longitude = longitude.to_f
      end

      name = doc.css("#leftcolumn").at_css("h1").text

      ramp_facts = {
        name: name,
        latitude: latitude,
        longitude: longitude,
      }

      ramp_info << ramp_facts
    end

    ramp_info[2][:latitude] = 34.7359
    ramp_info[5][:latitude] = 34.0896
    ramp_info[6][:latitude] = 34.1831
    ramp_info[6][:longitude] = -82.7022
    ramp_info[7][:longitude] = -82.579
    ramp_info[8][:latitude] = 33.8863
    ramp_info[8][:longitude] = -82.3678
    # binding.pry
    ramp_info
  end
end

ramp_scraper = RampScraper.new
ramp_scraper.scrape_lake_list
