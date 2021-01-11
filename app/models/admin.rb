class Admin < ApplicationRecord
  validates :id, presence: true
  validates :password, presence: true
  
  has_secure_password
end
