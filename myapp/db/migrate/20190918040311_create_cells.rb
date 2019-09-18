class CreateCells < ActiveRecord::Migration[6.0]
  def change
    create_table :cells do |t|
      t.string :name
      t.references :beehive, null: false, foreign_key: true
      t.references :cell_type, null: true, foreign_key: true
      t.timestamps
    end
  end
end
