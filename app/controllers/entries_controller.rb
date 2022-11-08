class EntriesController < ApplicationController
  before_action :authenticate_user, except: [:index]

  def index
    entries = Entry.all

    render json: entries.as_json
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
      lure_id: params[:lure_id],
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
      entry.lure_ids = params[:lure_ids] || entry.lure_ids
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

    entry.delete
    render json: { message: "entry deleted" }
  end
end
