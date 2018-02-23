class Trip < ApplicationRecord
  has_and_belongs_to_many :trails

  def total_hiking_distance
    self.trails.sum(:length)
  end
end
