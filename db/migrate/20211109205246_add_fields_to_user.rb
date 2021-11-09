class AddFieldsToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string
    add_column :users, :on_call_name, :string
    add_column :users, :pronouns, :string
    add_column :users, :bio, :text
    add_column :users, :phone_number, :string
    add_column :users, :timezone, :string, :default => 'America/New_York'
    add_column :users, :interface_language, :string, :default => 'en-US'
    add_column :users, :interface_color_scheme, :string, :default => 'System'
    add_column :users, :interface_contrast_level, :string, :default => 'System'
    add_column :users, :interface_motion_level, :string, :default => 'System'
    add_column :users, :break_between_conversations, :smallint, :default => 300
    add_column :users, :shift_reminder_text, :boolean, :default => 1
    add_column :users, :shift_reminder_email, :boolean, :default => 1
    add_column :users, :image, :text
  end
end
