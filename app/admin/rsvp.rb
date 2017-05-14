ActiveAdmin.register Rsvp do

  permit_params :invite_id, :guest_count, :vegetarian_count

  index do
    selectable_column
    id_column
    column :guest_count
    column :vegetarian_count
    # column :wants_breakfast
    column "Guest" do |rsvp|
      rsvp.invite.guest
    end
  end

  filter :guest_count
  filter :vegetarian_count
  # filter :wants_breakfast

  form do |f|
    f.inputs "RSVP Details" do
      f.input :invite_id, label: 'Invite', as: :select,
              collection: Invite.eager_load(:rsvp).merge(Rsvp.where(id: nil)).map{|i| ["#{i.guest}", i.id]}
      f.input :guest_count
      f.input :vegetarian_count
    end
    f.actions
  end

end
