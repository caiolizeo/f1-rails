class AddPhotoPathToFormulaOneCircuit < ActiveRecord::Migration[6.1]
  def change
    add_column :formula_one_circuits, :photo_path, :string
  end
end
