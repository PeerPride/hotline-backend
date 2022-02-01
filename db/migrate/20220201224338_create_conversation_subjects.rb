class CreateConversationSubjects < ActiveRecord::Migration[6.1]
  def change
    create_table :conversation_subjects, id: :uuid do |t|
      t.uuid :taggroup_id
      t.uuid :conversation_id

      t.timestamps
    end
  end
end
