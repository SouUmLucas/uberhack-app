class JourneyController < ApplicationController
  def index
  end

  def new
    @journey = Journey.new
    @journey.starting_points.build
    @journey.destinations.build
  end
end
