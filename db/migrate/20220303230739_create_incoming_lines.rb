class CreateIncomingLines < ActiveRecord::Migration[7.0]
  def change
    create_table :incoming_lines, id: :uuid do |t|
      t.string :name
      t.string :number
      t.boolean :is_active, :default => true
      t.text :phone_greeting_message
      t.text :text_greeting_message
      t.string :greeting_audio

      t.timestamps
    end

    create_table :incoming_lines_languages, id: false do |t|
      t.uuid :incoming_line_id
      t.uuid :language_id
    end
  end
end
