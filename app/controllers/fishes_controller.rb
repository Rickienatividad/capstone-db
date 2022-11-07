class FishesController < ApplicationController
  def index
    fish = Fish.all
    render json: fish.as_json
  end

  def show
    fish = Fish.find_by(id: params[:id])
    render json: fish.as_json
  end

  def create
    fish = Fish.new(
      entry_id: params[:entry_id],
      user_id: params[:user_id],
      lure_id: params[:lure_id],
      species: params[:species],
      length: params[:length],
      weight: params[:weight],
    )

    if fish.save
      render json: { message: "fish created" }
    else
      render json: { error: fish.errors.full_messages }
    end
  end

  def update
    fish = Fish.find_by(id: params[:id])

    fish.entry_id = params[:entry_id] || fish.entry_id
    fish.user_id = params[:user_id] || fish.user_id
    fish.lure_id = params[:lure_id] || fish.lure_id
    fish.species = params[:species] || fish.species
    fish.length = params[:length] || fish.length
    fish.weight = params[:weight] || fish.weight

    if fish.save
      render json: { message: "fish updated" }
    else
      render json: { error: fish.errors.full_messages }
    end
  end

  def destroy
    fish = Fish.find_by(id: params[:id])

    fish.delete
    render json: { message: "fish was deleted" }
  end
end
