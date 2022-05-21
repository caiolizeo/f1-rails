class AddValidationToBet < ActiveRecord::Migration[6.1]
  def change
    add_column :bets, :validated, :boolean, null: false, default: false
  end
end
