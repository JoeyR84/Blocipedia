class Wiki < ActiveRecord::Base
  has_many :collaborators
  has_many :collaborating_users, through: :collaborators, source: :user
  belongs_to :user
end
