class EntriesController < ApplicationController
  def index
    entries = Entry.all

    render json: entries.as_json
  end

  def show
    entry = Entry.find_by(id: params[:id])
    render json: entry.as_json
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
    entry = Entry.find_by(id: params["id"])

    entry.user_id = params[:user_id] || entry.user_id
    entry.lure_id = params[:lure_id] || entry.lure_id
    entry.location = params[:location] || entry.location
    entry.weather = params[:weather] || entry.weather
    entry.notes = params[:notes] || entry.notes
    entry.date = params[:date] || entry.date

    if entry.save
      render json: { message: "updated successfully" }
    else
      render json: { error: entry.errors.full_messages }
    end
  end
end
