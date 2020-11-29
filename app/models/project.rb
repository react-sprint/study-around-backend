class Project < ApplicationRecord
  has_many :studies
  belongs_to :group_user_and_project
end
