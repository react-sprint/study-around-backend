class GroupUserAndProject < ApplicationRecord
  has_many :users
  has_many :projects
end
