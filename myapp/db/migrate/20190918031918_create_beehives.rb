class CreateBeehives < ActiveRecord::Migration[6.0]
  def change
    create_table :beehives do |t|
      t.string :name

      t.timestamps
    end
  end
end
