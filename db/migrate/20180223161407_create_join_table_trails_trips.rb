class CreateJoinTableTrailsTrips < ActiveRecord::Migration[5.1]
  def change
    create_join_table :trails, :trips do |t|
      t.index [:trail_id, :trip_id]
      t.index [:trip_id, :trail_id]
    end
  end
end
