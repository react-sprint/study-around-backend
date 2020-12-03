class Project < ApplicationRecord
  has_many :group_user_and_project
  has_many :replies
end
