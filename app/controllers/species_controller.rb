class SpeciesController < ApplicationController
  def index
    species = Species.all
    render json: species.as_json
  end
end
