class CreateTagGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :tag_groups, id: :uuid do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
