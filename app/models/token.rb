class Token < ApplicationRecord
  #validations
  validates :auth_token, presence: true

  #class_methods
  def self.generate_auth_token
    SecureRandom.urlsafe_base64(nil, false)
  end
end
