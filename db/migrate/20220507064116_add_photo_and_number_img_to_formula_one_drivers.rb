class AddPhotoAndNumberImgToFormulaOneDrivers < ActiveRecord::Migration[6.1]
  def change
    add_column :formula_one_drivers, :photo_img, :string
    add_column :formula_one_drivers, :number_img, :string
  end
end
