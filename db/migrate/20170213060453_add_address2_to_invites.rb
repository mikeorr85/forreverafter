class AddAddress2ToInvites < ActiveRecord::Migration[5.0]
  def change
    add_column :invites, :address2, :string
  end
end
