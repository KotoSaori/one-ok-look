class User < ApplicationRecord
  validates :code, presence: true, uniqueness: true
  validates :section_id, presence: true
  validates :position_id, presence: true
  validates :name, presence: true, length: { maximum: 15 }
  validates :password, presence: true
  
  has_secure_password
  
  belongs_to :section
  belongs_to :position
end
