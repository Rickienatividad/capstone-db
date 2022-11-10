Species.destroy_all

scrape = Scraper.new
fresh_species = scrape.scrape_species_urls
Species.create_from_collection(fresh_species)
