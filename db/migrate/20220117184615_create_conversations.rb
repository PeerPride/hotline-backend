class CreateConversations < ActiveRecord::Migration[6.1]
  def change
    create_table :conversations, id: :uuid do |t|
      t.uuid :contact_id
      t.uuid :contactphone_id
      t.string :method
      t.text :notes
      t.string :provider_id
      t.integer :length
      t.timestamp :started_at
      t.timestamp :ended_at
      t.string :status, :default => 'Incoming'

      t.timestamps
    end
  end
end
