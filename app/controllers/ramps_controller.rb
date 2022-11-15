class RampsController < ApplicationController
  def index
    ramps = Ramp.all
    render json: ramps.as_json
  end
end
