class Destination < ApplicationRecord
  belongs_to :journey

  geocoded_by :address
end
