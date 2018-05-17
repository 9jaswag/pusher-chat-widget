class CreateChats < ActiveRecord::Migration[5.1]
  def change
    create_table :chats do |t|
      t.string :message
      t.string :email
      t.string :name
      t.string :chat_id

      t.timestamps
    end
  end
end
