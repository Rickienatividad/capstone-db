class SpeciesController < ApplicationController
  def index
    @species = Species.all
    render template: "species/index"
  end

  def show
    specie = Species.find_by(id: params["id"])
    render json: specie.as_json
  end
end
