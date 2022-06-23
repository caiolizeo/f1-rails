class AddPositionToF1Drivers < ActiveRecord::Migration[7.0]
  def change
    add_column :f1_drivers, :position, :integer
  end
end
