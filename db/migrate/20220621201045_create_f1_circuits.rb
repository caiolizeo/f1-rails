class CreateF1Circuits < ActiveRecord::Migration[7.0]
  def change
    create_table :f1_circuits do |t|
      t.string :name
      t.string :code
      t.string :country
      t.string :latitude
      t.string :longitude
      t.string :local
      t.integer :round
      t.datetime :fp1
      t.datetime :fp2
      t.datetime :fp3
      t.datetime :qualifying
      t.datetime :sprint
      t.datetime :race
      t.integer :year
      t.string :photo_path

      t.timestamps
    end
  end
end
