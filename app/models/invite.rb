class Invite < ApplicationRecord
  validates :invite_code, uniqueness: true
  validates :guest, presence: true
  validates :last_name, presence: true
  validates :address, presence: true

  before_create :upcase_last_name
  after_create :generate_invite_code

  def upcase_last_name
    self.last_name = self.last_name.upcase
  end

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
