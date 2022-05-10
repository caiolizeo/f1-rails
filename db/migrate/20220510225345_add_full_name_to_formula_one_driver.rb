class AddFullNameToFormulaOneDriver < ActiveRecord::Migration[6.1]
  def change
    add_column :formula_one_drivers, :full_name, :string
  end
end
