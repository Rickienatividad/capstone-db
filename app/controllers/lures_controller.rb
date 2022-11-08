class LuresController < ApplicationController
  before_action :authenticate_user

  def index
    if current_user
      lures = current_user.lures
      render json: lures.as_json
    else
      render json: { message: "login to view your lures" }
    end
  end

  def show
    lure = Lure.find_by(id: params[:id])
    if current_user && current_user.id == lure.user_id
      render json: lure.as_json
    else
      render json: { message: "not authorized" }, status: :unauthorized
    end
  end

  def create
    lure = Lure.new(
      entry_id: params[:entry_id],
      user_id: params[:user_id],
      name: params[:name],
      color: params[:color],
    )
    if lure.save
      render json: { message: "lure created" }
    else
      render json: { error: lure.errors.full_messages }
    end
  end

  def destroy
    lure = Lure.find_by(id: params[:id])
    if current_user && current_user.id == lure.user_id
      lure.destroy
      render json: { message: "lure deleted." }
    else
      render json: { message: "not authorized." }, status: :unauthorized
    end
  end
end
