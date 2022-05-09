class AddCodeToFormulaOneDriver < ActiveRecord::Migration[6.1]
  def change
    add_column :formula_one_drivers, :code, :string
  end
end
