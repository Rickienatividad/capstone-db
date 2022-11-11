# Species.destroy_all

# scrape = Scraper.new
# fresh_species = scrape.scrape_species_urls
# Species.create_from_collection(fresh_species)

Knot.destroy_all

knot_scraper = KnotScraper.new
knot_list = knot_scraper.scrape_knot_link
Knot.create_from_collection(knot_list)
