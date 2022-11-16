Species.destroy_all

scrape = Scraper.new
fresh_species = scrape.scrape_species_urls
Species.create_from_collection(fresh_species)

# Knot.destroy_all

# knot_scraper = KnotScraper.new
# knot_list = knot_scraper.scrape_knot_link
# Knot.create_from_collection(knot_list)

# Ramp.destroy_all

# ramp_scraper = RampScraper.new
# ramp_info = ramp_scraper.scrape_lake_list
# Ramp.create_from_collection(ramp_info)
