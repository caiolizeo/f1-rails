class CreateF1Drivers < ActiveRecord::Migration[7.0]
  def change
    create_table :f1_drivers do |t|
      t.string :first_name
      t.string :last_name
      t.string :full_name
      t.string :code
      t.string :country
      t.string :team
      t.string :number
      t.string :year
      t.string :photo_img
      t.string :logo_img

      t.timestamps
    end
  end
end
