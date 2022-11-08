class EntriesController < ApplicationController
  before_action :authenticate_user

  def index
    if current_user
      entries = current_user.entries

      render json: entries.as_json
    else
      render json: { message: "You can only view your own entries." }
    end
  end

  def show
    if current_user && current_user.id == entry.user_id
      entry = Entry.find_by(id: params[:id])
      render json: entry.as_json
    else
      render json: { message: "Please log in" }
    end
  end

  def create
    entry = Entry.new(
      user_id: params[:user_id],
      location: params[:location],
      weather: params[:weather],
      notes: params[:notes],
      date: params[:date],
    )
    if entry.save
      render json: { message: "entry created succesfully" }
    else
      render json: { error: entry.errors.full_messages }
    end
  end

  def update
    entry = Entry.find_by(id: params[:id])
    if current_user && current_user.id == entry.user_id
      entry.user_id = params[:user_id] || entry.user_id
      entry.location = params[:location] || entry.location
      entry.weather = params[:weather] || entry.weather
      entry.notes = params[:notes] || entry.notes
      entry.date = params[:date] || entry.date

      if entry.save
        render json: { message: "updated successfully" }
      else
        render json: { error: entry.errors.full_messages }
      end
    else
      render json: { message: "This is entry is only able to be updated by the owner." }
    end
  end

  def destroy
    entry = Entry.find_by(id: params["id"])
    if current_user && current_user.id == entry.user_id
      entry.delete
      render json: { message: "entry deleted" }
    else
      render json: { message: "you are not authorized to delete this entry." }
    end
  end
end
