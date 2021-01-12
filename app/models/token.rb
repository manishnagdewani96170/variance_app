class Token < ApplicationRecord
  validates :auth_token, presence: true
end
