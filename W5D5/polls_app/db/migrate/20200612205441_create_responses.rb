class CreateResponses < ActiveRecord::Migration[5.2]
  def change
    create_table :responses do |t|
      t.integer :question_key
      t.integer :answer_choice_key
    end
  end
end
