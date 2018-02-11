class CreateConversations < ActiveRecord::Migration[5.1]
  def change
    create_table :conversations do |t|
      t.string :message
      t.integer :conversation_id
    end
  end
end
