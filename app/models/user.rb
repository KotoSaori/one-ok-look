class User < ApplicationRecord
  validates :code, presence: true, uniqueness: true
  
  validates :name, presence: true, length: { maximum: 15 }
  validates :password, presence: true, on: :create
  
  has_secure_password
  
  belongs_to :section
  belongs_to :position
end
