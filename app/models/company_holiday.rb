class CompanyHoliday < ApplicationRecord
  validates :holiday, presence: true, uniqueness: true
  
end
