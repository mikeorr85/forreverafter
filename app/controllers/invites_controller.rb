class InvitesController < ApplicationController

  def lookup
    code = invite_params[:invite_code].upcase
    @invite = Invite.find_by(invite_code: code, last_name: invite_params[:last_name])

    if @invite.nil?
      flash[:danger] = "We couldn't find the invite. Please double check the last name and code."
    end

    render json: @invite
  end

  private

  def invite_params
    params.require(:invite).permit(:invite_code, :last_name)
  end

end
