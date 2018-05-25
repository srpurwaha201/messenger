class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
      t.references :chatroom, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
