class CreateTagCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :tag_categories, id: :uuid do |t|
      t.string :name
      t.integer :item_order, :default => 0, :unsigned => true
      t.text :description

      t.timestamps
    end
  end
end
