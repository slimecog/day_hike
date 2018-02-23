class Trail < ApplicationRecord
  has_and_belongs_to_many :trips

  def number_of_hikes
    self.trips.count
  end
end
