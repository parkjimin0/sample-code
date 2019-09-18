class AddColumnsToCells < ActiveRecord::Migration[6.0]
  def change
    add_column :cells, :cell_type_id, :string
    add_column :cells, :—force, :string
  end
end
