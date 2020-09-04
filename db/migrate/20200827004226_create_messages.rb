class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.string :message_content
      t.integer :chat_id
      
      t.timestamps
    end
  end
end
