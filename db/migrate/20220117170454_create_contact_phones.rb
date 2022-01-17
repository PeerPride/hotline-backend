class CreateContactPhones < ActiveRecord::Migration[6.1]
  def change
    create_table :contact_phones, id: :uuid do |t|
      t.uuid :contact_id
      t.string :phone
      t.boolean :is_primary, :default => false
      t.string :city
      t.string :state
      t.string :country
      t.string :zip

      t.timestamps
    end
  end
end
