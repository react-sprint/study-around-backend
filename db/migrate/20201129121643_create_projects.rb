class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      
      t.string :name
      t.string :introduction
      t.string :authorization_password
      t.string :manager_introduce
      t.string :link
      
      t.timestamps
    end
  end
end
