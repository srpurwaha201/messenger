class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.references :user, index: true, foreign_key: true
      t.text :content
      t.references :chatroom, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
