class RemoveDateAndTimeFromFormulaOneCircuit < ActiveRecord::Migration[6.1]
  def change
    remove_column :formula_one_circuits, :date, :datatype
    remove_column :formula_one_circuits, :time, :datatype
  end
end
