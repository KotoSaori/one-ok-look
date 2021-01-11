class Section < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :email, presence: true
  
  has_many :users
end
