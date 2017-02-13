class Rsvp < ApplicationRecord
  belongs_to :invite

  validates_presence_of :invite
  validates_uniqueness_of :invite, message: "RSVP already submitted. Please contact JoRae or Mike to change it."
end
