class User < ApplicationRecord
  has_secure_token :auth_token
  has_secure_password

  validates_uniqueness_of :email
end
