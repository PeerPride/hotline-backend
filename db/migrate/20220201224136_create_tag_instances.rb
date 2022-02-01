class CreateTagInstances < ActiveRecord::Migration[6.1]
  def change
    create_table :tag_instances, id: :uuid do |t|
      t.uuid :tag_id
      t.uuid :tagcategory_id
      t.integer :item_order, :default => 0, :unsigned => true

      t.timestamps
    end
  end
end
