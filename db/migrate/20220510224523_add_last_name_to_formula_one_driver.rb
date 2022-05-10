class AddLastNameToFormulaOneDriver < ActiveRecord::Migration[6.1]
  def change
    add_column :formula_one_drivers, :last_name, :string
  end
end
