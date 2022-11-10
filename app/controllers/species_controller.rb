class SpeciesController < ApplicationController
  def index
    species = Species.all
    render json: species.as_json
  end

  def show
    specie = Species.find_by(id: params["id"])
    render json: specie.as_json
  end
end
