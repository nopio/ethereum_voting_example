class CreateVotings < ActiveRecord::Migration[5.1]
  def change
    create_table :votings do |t|
      t.string :contract_address, null: false
      t.text :meals
      t.timestamps
    end
  end
end
