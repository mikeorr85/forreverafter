class CreateRsvps < ActiveRecord::Migration[5.0]
  def change
    create_table :rsvps do |t|
      t.references :invite, foreign_key: true
      t.integer :guest_count

      t.timestamps
    end
  end
end
