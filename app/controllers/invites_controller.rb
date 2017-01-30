class InvitesController < ApplicationController

  def show
    @invite = Invite.find_by_invite_code(invite_params[:invite_code])
    render json: @invite
  end

  private

  def invite_params
    params.require(:invite).permit(:invite_code)
  end

end
