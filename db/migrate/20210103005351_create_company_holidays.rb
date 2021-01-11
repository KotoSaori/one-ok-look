class CreateCompanyHolidays < ActiveRecord::Migration[5.2]
  def change
    create_table :company_holidays do |t|
      t.integer :section_id
      t.date :holiday

      t.timestamps
    end
  end
end
