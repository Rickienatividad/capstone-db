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
    boat_ramps_list.each do |ramp|
      html = URI.open(ramp)
      doc = Nokogiri::HTML(html)

      latitude = doc.css("#leftcolumn").css("div")[2].text[/\Latitude: \d{2}\.\d{5}/]
      binding.pry
    end
  end
end

ramp_scraper = Ramp_scraper.new
ramp_scraper.scrape_lake_list
