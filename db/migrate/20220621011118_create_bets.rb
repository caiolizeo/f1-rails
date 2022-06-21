class CreateBets < ActiveRecord::Migration[7.0]
  def change
    create_table :bets do |t|
      t.references :user, null: false, foreign_key: true
      t.string :circuit
      t.integer :year
      t.string :pole
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
      t.integer :result_points
      t.boolean :validated

      t.timestamps
    end
  end
end
