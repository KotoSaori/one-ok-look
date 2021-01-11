class CreateAdmins < ActiveRecord::Migration[5.2]
  def change
    create_table :admins, id: false do |t| # id: falseを追加
      t.string :id, null: false, primary_key: true # primary_key: trueを追加
      t.string :password, null: false

      t.timestamps
    end
  end
end
