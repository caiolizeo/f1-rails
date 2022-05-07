class AddPointsToBet < ActiveRecord::Migration[6.1]
  def change
    add_column :bets, :result_points, :integer
  end
end
