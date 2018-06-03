class Journey < ApplicationRecord
  belongs_to :user
  has_many :starting_points, class_name: 'StartingPoint'
  has_many :destinations, class_name: 'Destination'
end
