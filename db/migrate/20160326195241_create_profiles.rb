class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.date :birthday
      t.string :gender
      t.string :city
      t.string :state

      t.timestamps null: false
    end
  end
end
