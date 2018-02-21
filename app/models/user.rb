class User < ApplicationRecord
  has_and_belongs_to_many :votings, join_table: :votings_users

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
