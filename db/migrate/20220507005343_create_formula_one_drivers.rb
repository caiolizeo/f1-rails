class CreateFormulaOneDrivers < ActiveRecord::Migration[6.1]
  def change
    create_table :formula_one_drivers do |t|
      t.string :Name
      t.string :Country
      t.string :Team
      t.integer :Number
      t.integer :Position
      t.integer :points
      t.integer :year

      t.timestamps
    end
  end
end
