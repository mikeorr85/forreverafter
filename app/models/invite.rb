class Invite < ApplicationRecord
  validates :invite_code, uniqueness: true
  validates :guest, presence: true
  validates :last_name, presence: true
  validates :address, presence: true
  validates :address2, presence: true

  before_create :upcase_last_name
  after_create :generate_invite_code

  has_one :rsvp

  def upcase_last_name
    self.last_name = self.last_name.upcase
  end

  def generate_invite_code
    while self.invite_code.nil?
      random_code = SecureRandom.urlsafe_base64(6).upcase

      if random_code.include?("-") || random_code.include?("_") || Invite.exists?(invite_code: random_code)
        self.invite_code = nil
      else
        self.invite_code = random_code
        self.save
      end
    end
  end
end