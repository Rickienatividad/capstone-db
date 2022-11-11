class KnotsController < ApplicationController
  def index
    knots = Knot.all
    render json: knots.as_json
  end

  def show
    knot = Knot.find_by(id: params["id"])
    render json: knot.as_json
  end
end
