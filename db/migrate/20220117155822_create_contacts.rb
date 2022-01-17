class CreateContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts, id: :uuid do |t|
      t.string :codename
      t.text :notes
      t.boolean :blocked, :default => false

      t.timestamps
    end
  end
end
