class CreateBets < ActiveRecord::Migration[6.1]
  def change
    create_table :bets do |t|
      t.references :user, null: false, foreign_key: true
      t.string :circuit
      t.integer :year
      t.string :pole_position
      t.string :first
      t.string :second
      t.string :third
      t.string :fourth
      t.string :fifth
      t.string :sixth
      t.string :seventh
      t.string :eighth
      t.string :ninth
      t.string :tenth

      t.timestamps
    end
  end
end
