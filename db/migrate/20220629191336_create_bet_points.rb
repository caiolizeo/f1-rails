class CreateBetPoints < ActiveRecord::Migration[7.0]
  def change
    create_table :bet_points do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :points
      t.integer :year

      t.timestamps
    end
  end
end
