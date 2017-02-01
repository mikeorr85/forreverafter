class RsvpsController < ApplicationController

  def new
    @rsvp = Rsvp.new
  end

  def create
    @rsvp = Rsvp.new(rsvp_params)
    if @rsvp.save
      redirect_to root_path
      flash[:info] = "Thank you for your RSVP. We're looking forward to seeing you!"
    else
      flash[:danger] = @rsvp.errors.full_messages.to_sentence
      render :new
    end
  end

  def rsvp_params
    params.require(:rsvp).permit(:invite_id, :guest_count)
  end

end
