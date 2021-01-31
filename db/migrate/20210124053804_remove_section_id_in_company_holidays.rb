class RemoveSectionIdInCompanyHolidays < ActiveRecord::Migration[5.2]
  def change
    remove_column :company_holidays, :section_id, :integer
  end
end
