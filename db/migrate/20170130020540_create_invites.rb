class CreateInvites < ActiveRecord::Migration[5.0]
  def change
    create_table :invites do |t|
      t.string :guest
      t.string :address
      t.integer :estimated_party_count
      t.string :invite_code

      t.timestamps
    end
  end
end
