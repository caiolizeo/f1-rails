class RemoveValidatedFromBet < ActiveRecord::Migration[7.0]
  def change
    remove_column :bets, :validated, :boolean
    add_column :bets, :validated, :boolean, null: false, default: false

  end
end
