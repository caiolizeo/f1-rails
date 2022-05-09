class CreateFormulaOneDriver < ActiveRecord::Migration[6.1]
  def change
    create_table :formula_one_drivers do |t|
      t.string :name
      t.string :country
      t.string :team
      t.integer :number
      t.integer :year
      t.string :photo_img
      t.string :logo_img

      t.timestamps
    end
  end
end
