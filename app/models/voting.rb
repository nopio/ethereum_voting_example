class Voting < ActiveRecord::Base
  has_and_belongs_to_many :users, join_table: :votings_users
  serialize :meals, Array
end
