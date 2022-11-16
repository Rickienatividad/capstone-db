Species.destroy_all

scrape = Scraper.new
fresh_species = scrape.scrape_species_urls
Species.create_from_collection(fresh_species)

Knot.destroy_all

knot_scraper = KnotScraper.new
knot_list = knot_scraper.scrape_knot_link
Knot.create_from_collection(knot_list)

Ramp.destroy_all

ramp_scraper = RampScraper.new
ramp_info = ramp_scraper.scrape_lake_list
Ramp.create_from_collection(ramp_info)

Entry.create(
  user_id: 1,
  location: "Big Lake",
  weather: "sunny",
  notes: "Slow bite. Tried artificials and live bait. No luck.",
  date: 20210101,
)

Fish.create(
  entry_id: 1,
  user_id: 1,
  species: "catfish",
  length: 15,
  weight: 6,
)

Knot.create(
  name: "blood knot",
  img: "https://www.101knots.com/wp-content/uploads/2017/08/How-to-Tie-a-Blood-Knot.jpg",
)

Lure.create(
  entry_id: 1,
  user_id: 1,
  name: "beetlespin",
  color: "yellow",
)

Ramp.create(
  name: "Greenwood Access Area",
  latitude: 34.7415,
  longitude: -81.92005,
)

Species.create(
  name: "American eel  (Anguilla rostrata) - Native",
  length: "Average Length: 2 ½ feet",
  weight: "Average Size: ½ to 3 pounds",
  habits: "Fish,  insects, worms, snails, clams and crabs.  ",
  img: "https://www.dnr.sc.gov/fish/species/assets/americaneellg.jpg",
  description: "Description: (Anatomy of a Fish) American eel have a snakelike body that is olive green in  color that fades to yellow or white on the belly. It lacks pelvic fins.",
)

User.create(
  name: "test3",
  email: "test3@test.com",
  password: "password",
  password_confirmation: "password",
)
