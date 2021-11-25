class CreateSettings < ActiveRecord::Migration[6.1]
  def change
    create_table :settings, id: :uuid do |t|
      t.text :name, null: false
      t.text :value
      t.string :type_hint, null: false, default: 'string'

      t.timestamps
    end
  end
end
