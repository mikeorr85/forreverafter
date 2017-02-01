class Invite < ApplicationRecord
  validates :invite_code, uniqueness: true
  validates :guest, presence: true
  validates :last_name, presence: true
  validates :address, presence: true

  after_create :generate_invite_code

  def generate_invite_code
    while self.invite_code.nil?
      random_code = SecureRandom.hex(4).upcase
      if Invite.exists?(invite_code: random_code)
        self.invite_code = nil
      else
        self.invite_code = random_code
        self.save
      end
    end
  end
end
