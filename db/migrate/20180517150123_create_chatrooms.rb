class CreateChatrooms < ActiveRecord::Migration[5.1]
  def change
    create_table :chatrooms do |t|
      t.string :email
      t.string :name
      t.string :room_id

      t.timestamps
    end
  end
end