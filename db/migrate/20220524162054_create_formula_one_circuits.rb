class CreateFormulaOneCircuits < ActiveRecord::Migration[6.1]
  def change
    create_table :formula_one_circuits do |t|
      t.string :name
      t.string :country
      t.date :date
      t.string :code
      t.string :latitude
      t.string :longitude
      t.string :local
      t.integer :round
      t.string :time

      t.timestamps
    end
  end
end
