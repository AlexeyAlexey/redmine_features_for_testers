class UserTester < ActiveRecord::Base
  unloadable
  belongs_to :user

  validates :user_id, uniqueness: true

  attr_accessor :ciphered_password_confirmation

  validates :ciphered_password, confirmation: true
  validates :ciphered_password, presence: true

  validate do
    if ciphered_password_confirmation && ciphered_password != ciphered_password_confirmation
      errors.add(:ciphered_password, :confirmation)
    end
  end

  #attr_accessor :ciphered_password_confirmation
end
