class AddTotalCountToBeehives < ActiveRecord::Migration[6.0]
  def change
    add_column :beehives, :total_count, :json
  end
end
