require "httparty"
require "nokogiri"
require "pry"
require "open-uri"

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
    binding.pry
  end
end

ramp_scraper = Ramp_scraper.new
ramp_scraper.scrape_lake_list
