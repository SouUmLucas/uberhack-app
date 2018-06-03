class JourneyController < ApplicationController
  def index
  end

  def new
    @journey = Journey.new

    starting_point = StartingPoint.new(address: 'Av. Braz Leme 1000, Sao Paulo')
    destination = Destination.new(address: params[:destination])

    starting_point.coordinate!
    destination.coordinate!

    @friends = get_friends(starting_point, destination)
    @journey.starting_points << starting_point

    @journey.destinations << destination
  end

  private

  def get_friends(my_starting_point, my_destination_point)

    starting_points = StartingPoint.all

    nearest_me = starting_points.select { |start| start.distance_to([my_starting_point.latitude, my_starting_point.longitude]) < 0.15 }

    journeys = Destination.where(journey_id: nearest_me.pluck(:journey_id))
    
    common_journeys = journeys.select { |journey| journey.distance_to([my_destination_point.latitude, my_destination_point.longitude]) < 0.15 }

    StartingPoint.where(journey_id: common_journeys.pluck(:journey_id))
  end
end
