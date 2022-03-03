class CreateLanguages < ActiveRecord::Migration[7.0]
  def change
    create_table :languages, id: :uuid do |t|
      t.string :name
      t.string :local_name
      t.boolean :active, :default => true

      t.timestamps
    end

    create_table :languages_users, id: false do |t|
      t.uuid :user_id
      t.uuid :language_id
    end
  end
end
