class AddYearToFormulaOneCircuit < ActiveRecord::Migration[6.1]
  def change
    add_column :formula_one_circuits, :year, :integer
  end
end
