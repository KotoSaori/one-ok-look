class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :code
      t.integer :section_id
      t.integer :position_id
      t.string :name
      t.string :password
      t.string :image

      t.timestamps
    end
  end
end
