class DropCellCategories < ActiveRecord::Migration[6.0]
  def up
    drop_table :cell_categories
  end

  def down
    fail ActiveRecord::IrreversibleMigration
  end
end
