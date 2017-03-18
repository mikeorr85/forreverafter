class AddVegetarianCountToRsvps < ActiveRecord::Migration[5.0]
  def change
    add_column :rsvps, :vegetarian_count, :integer, default: 0
  end
end
