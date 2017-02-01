ActiveAdmin.register Invite do

  permit_params :last_name, :guest, :address, :invite_code, :estimated_party_count

  index do
    selectable_column
    id_column
    column :last_name
    column :guest
    column :address
    column :invite_code
    column :estimated_party_count
    actions
  end

  # filter :last_name
  # filter :guest
  # filter :address

  form do |f|
    f.inputs "Invite Details" do
      f.input :last_name
      f.input :guest
      f.input :address
      f.input :estimated_party_count
    end
    f.actions
  end

end
