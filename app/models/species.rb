class Species < ApplicationRecord
  def self.create_from_collection(fresh_species)
    fresh_species.each do |specie|
      Species.create(specie)
    end
  end
end
