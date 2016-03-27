class CreatePrompts < ActiveRecord::Migration
  def change
    create_table :prompts do |t|
      t.text :prompt_question
      t.timestamps null: false
    end
  end
end
