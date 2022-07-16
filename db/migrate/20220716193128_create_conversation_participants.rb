class CreateConversationParticipants < ActiveRecord::Migration[7.0]
  def change
    create_table :conversation_participants, id: :uuid do |t|
      t.uuid :conversation_id
      t.uuid :user_id
      t.timestamp :started_at
      t.timestamp :ended_at
      t.boolean :leader

      t.timestamps
    end
  end
end
