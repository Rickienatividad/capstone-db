# Ruby on Reels

This is the back-end component for a fishing utility app that gives users access to reference material such as images and habits of freshwater species of fish, knot tying instructions and examples, and a map depicting locations of public boat ramps in the state of South Carolina. Future features will allow the user to drop a marker on the map that associates with the location of their log entries. Information for the knots, fish species, and boat ramp coordinates were scraped from various websites utilizing Ruby gems. 
<strong>The repository for the front-end component of this application can be found</strong> [HERE](https://github.com/Rickienatividad/capstone-frontend) .

Technologies utilized to bring things to life:

* Ruby version 3.1.1

* Ruby on Rails

* Postgres

* HTTParty gem

* Nokogiri gem

* Pry

* Open-URI

## Installation

From the terminal, cd into your desired directory and use the following command to clone down the app:
```bash
git clone https://github.com/Rickienatividad/capstone-db.git
```

cd into the project.

Next access the ability to use all the gems and features by doing a bundle install:
```bash
rails bundle install
```

Create your database and migrate it:
```bash
rails db:create
rails db:migrate
```
If wanted, you can populate your database with ready made data by running:
```bash
rails db:seed
```

## Gems and Tools Used and Explanations
* HTTParty - This gem was used in the scraper.rb, knot_scraper.rb, and ramp_scraper.rb files to perform GET requests on various urls that to return HTML string data. These strings were then utilized by the next gem noted (Nokogiri).
* Nokogiri - This gem took the string returned by HTTParty and creates Nokogiri nodes which can be targeted via css or xml properties. Using this targeted information allowed specific information to be scraped and eventually populated into the database.
* Pry - This was used throughout the scraping process to debug and view arrays as they were being built to ensure the correct information was being gathered.
* Open-URI - This was used interchangeably with HTTParty to perform GET requests.


