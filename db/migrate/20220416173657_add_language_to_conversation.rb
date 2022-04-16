class AddLanguageToConversation < ActiveRecord::Migration[7.0]
  def change
    add_column :conversations, :language_id, :uuid
  end
end
