ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content only: :index do
    render 'index'
  end

  controller do
     def index
       @invite_count = Invite.count
       @invite_guest_count = Invite.sum(:estimated_party_count)
       @rsvp_count = Rsvp.count
       @rsvp_guest_count = Rsvp.sum(:guest_count)
       @vegetarian_count = Rsvp.sum(:vegetarian_count)

       @latest_rsvps = Rsvp.last(10).reverse
     end
  end

  # content title: proc{ I18n.t("active_admin.dashboard") } do
  #   div class: "blank_slate_container", id: "dashboard_default_message" do
  #     span class: "blank_slate" do
  #       span I18n.t("active_admin.dashboard_welcome.welcome")
  #       small I18n.t("active_admin.dashboard_welcome.call_to_action")
  #     end
  #   end

    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  # end # content
end
