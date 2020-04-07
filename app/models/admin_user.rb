class AdminUser < ApplicationRecord
  has_secure_password

  has_many :topics
end
