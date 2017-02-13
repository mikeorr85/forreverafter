class InvitesController < ApplicationController

  def lookup
    code = invite_params[:invite_code].upcase
    last_name = invite_params[:last_name].upcase
    @invite = Invite.find_by(invite_code: code, last_name: last_name)

    if @invite.nil?
      flash[:danger] = "We couldn't find the invite. Please double check the last name and code."
    else
      @rsvp = Rsvp.where(invite_id: @invite.id).first

      if @rsvp.present?
        @invite = nil # return nil so JS doesn't show rsvp form

        if @rsvp.guest_count < 1
          flash[:danger] = "We already have you booked as not attending. Please contact Mike or JoRae to change your RSVP."
        else
          flash[:danger] = "We already have you booked for #{@rsvp.guest_count}. Please contact Mike or JoRae to change your RSVP or guest count."
        end
      end
    end

    render json: @invite
  end

  private

  def invite_params
    params.require(:invite).permit(:invite_code, :last_name)
  end

end
