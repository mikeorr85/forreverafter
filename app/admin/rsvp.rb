ActiveAdmin.register Rsvp do

  # permit_params :guest_count

  index do
    selectable_column
    id_column
    column :guest_count
    column "Guest" do |rsvp|
      rsvp.invite.guest
    end
  end

  filter :guest_count

end
