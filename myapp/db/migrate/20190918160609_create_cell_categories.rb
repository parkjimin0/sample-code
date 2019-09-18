class CreateCellCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :cell_categories do |t|
      t.string :type

      t.timestamps
    end
  end
end
