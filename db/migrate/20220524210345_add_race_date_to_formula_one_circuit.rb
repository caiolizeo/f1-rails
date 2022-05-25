class AddRaceDateToFormulaOneCircuit < ActiveRecord::Migration[6.1]
  def change
    add_column :formula_one_circuits, :race_date, :datetime
  end
end
