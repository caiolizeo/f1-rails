class AddWinsToF1Drivers < ActiveRecord::Migration[7.0]
  def change
    add_column :f1_drivers, :wins, :integer
  end
end
