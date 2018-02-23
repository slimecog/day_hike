class Trip < ApplicationRecord
  has_and_belongs_to_many :trails

  def total_hiking_distance
    self.trails.sum(:length)
  end

  def average_hiking_distance
    self.trails.average(:length)
  end

  def longest_hiking_distance
    self.trails.maximum(:length)
  end
end
