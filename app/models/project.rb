class Project < ApplicationRecord
  has_many :group_user_and_projects
  has_many :replies
end
