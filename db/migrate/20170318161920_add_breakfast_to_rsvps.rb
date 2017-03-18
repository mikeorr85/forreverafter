class AddBreakfastToRsvps < ActiveRecord::Migration[5.0]
  def change
    add_column :rsvps, :wants_breakfast, :boolean, default: true
  end
end
