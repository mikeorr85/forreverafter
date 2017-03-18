class RsvpsController < ApplicationController

  def new
    @rsvp = Rsvp.new
  end

  def create
    @rsvp = Rsvp.new(rsvp_params)
    if @rsvp.save
      if (@rsvp.guest_count.nil? || @rsvp.guest_count < 1)
        flash[:info] = "Sorry that you are not able to make. Thank you for your RSVP!"
      else
        flash[:info] = "Thank you for your RSVP. We're looking forward to seeing you!"
      end

      redirect_to root_path
    else
      flash[:danger] = @rsvp.errors.full_messages.to_sentence
      render :new
    end
  end

  def rsvp_params
    params.require(:rsvp).permit(:invite_id, :guest_count, :vegetarian_count, :wants_breakfast)
  end

end
