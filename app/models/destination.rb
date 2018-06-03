class Destination < ApplicationRecord
  belongs_to :journey

  geocoded_by :address

  def coordinate!
    coordinates = geocode
    latitude = coordinates[0]
    longitude = coordinates[1]
    return
  end
end
