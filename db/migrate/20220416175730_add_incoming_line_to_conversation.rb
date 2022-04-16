class AddIncomingLineToConversation < ActiveRecord::Migration[7.0]
  def change
    add_column :conversations, :incoming_line_id, :uuid
  end
end
