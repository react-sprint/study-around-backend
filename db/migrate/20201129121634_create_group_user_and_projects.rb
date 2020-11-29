class CreateGroupUserAndProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :group_user_and_projects do |t|
      t.references :project
      t.references :user
      
      t.timestamps
    end
  end
end
