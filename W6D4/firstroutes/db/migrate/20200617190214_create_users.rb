class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :names, null: false
      t.string :emails, null: false
    end
  end
end
