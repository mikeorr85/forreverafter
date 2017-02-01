class AddLastNameToInvite < ActiveRecord::Migration[5.0]
  def change
    add_column :invites, :last_name, :string
  end
end
