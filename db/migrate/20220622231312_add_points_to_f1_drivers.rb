class AddPointsToF1Drivers < ActiveRecord::Migration[7.0]
  def change
    add_column :f1_drivers, :points, :integer
  end
end
