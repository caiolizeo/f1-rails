class DropFormulaOneDrivers < ActiveRecord::Migration[6.1]
  def change
    drop_table :formula_one_drivers
  end
end
