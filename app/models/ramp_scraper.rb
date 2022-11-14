require "httparty"
require "nokogiri"
require "pry"

class Ramp_scraper
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
    scrape_urls(lake_array)
  end

  def scrape_urls(lake_array)
  end
end

ramp_scraper = Ramp_scraper.new
ramp_scraper.scrape_lake_list
