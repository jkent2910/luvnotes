class AddLuverIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :luver_id, :integer
  end
end
