class CreatePromptResponses < ActiveRecord::Migration
  def change
    create_table :prompt_responses do |t|
      t.belongs_to :prompt, index: true
      t.belongs_to :user, index: true
      t.datetime :send_date
      t.text :response
      t.integer :luver_id


      t.timestamps null: false
    end
  end
end
