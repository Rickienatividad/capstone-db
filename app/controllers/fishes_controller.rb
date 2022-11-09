class FishesController < ApplicationController
  before_action :authenticate_user

  def index
    if current_user
      fish = current_user.fish
      render json: fish.as_json
    else
      render json: { message: "You aren't authorized to view this fish's info." }
    end
  end

  def show
    fish = Fish.find_by(id: params[:id])
    if current_user && current_user.id == fish.user_id
      render json: fish.as_json
    else
      render json: { message: "You aren't authorized to view this info." }, status: :unauthorized
    end
  end

  def create
    fish = Fish.new(
      entry_id: params[:entry_id],
      user_id: params[:user_id],
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
    if current_user && current_user.id == fish.user_id
      fish.entry_id = params[:entry_id] || fish.entry_id
      fish.user_id = params[:user_id] || fish.user_id
      fish.species = params[:species] || fish.species
      fish.length = params[:length] || fish.length
      fish.weight = params[:weight] || fish.weight

      if fish.save
        render json: { message: "fish updated" }
      else
        render json: { error: fish.errors.full_messages }
      end
    else
      render json: { message: "Not authorized" }, status: :unauthorized
    end
  end

  def destroy
    fish = Fish.find_by(id: params[:id])
    if current_user && current_user.id == fish.user_id
      fish.delete
      render json: { message: "fish was deleted" }
    else
      render json: { message: "Not authorized to perform this action" }, status: :unauthorized
    end
  end
end
