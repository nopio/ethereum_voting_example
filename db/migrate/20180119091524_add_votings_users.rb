class AddVotingsUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :votings_users do |t|
      t.integer :user_id, null: false
      t.integer :voting_id, null: false
    end
  end
end
