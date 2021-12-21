class CreateTeamsUsersJoin < ActiveRecord::Migration[6.1]
  def change
    create_table :teams_users, id: false do |t|
      t.uuid :team_id
      t.uuid :user_id
    end
  end
end
