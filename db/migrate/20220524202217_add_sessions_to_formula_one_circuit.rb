class AddSessionsToFormulaOneCircuit < ActiveRecord::Migration[6.1]
  def change
    add_column :formula_one_circuits, :fp1, :datetime
    add_column :formula_one_circuits, :fp2, :datetime
    add_column :formula_one_circuits, :fp3, :datetime
    add_column :formula_one_circuits, :qualifying, :datetime
    add_column :formula_one_circuits, :sprint, :datetime
  end
end
