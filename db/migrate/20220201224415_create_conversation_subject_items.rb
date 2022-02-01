class CreateConversationSubjectItems < ActiveRecord::Migration[6.1]
  def change
    create_table :conversation_subject_items, id: :uuid do |t|
      t.uuid :conversationsubject_id
      t.uuid :taginstance_id

      t.timestamps
    end
  end
end
