class CreateTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :teams, id: :uuid do |t|
      t.string :name
      t.text :description
      t.uuid :lead_id, optional: true

      t.timestamps
    end
  end
end
