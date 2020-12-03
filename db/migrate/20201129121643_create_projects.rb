class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      
      t.string :name
      t.string :introduce
      t.string :authorization_password
      t.integer :manager
      t.string :manager_introduce
      # t.string :link

      t.string :wday  # array 형태로 저장됨
      t.integer :start_hour
      t.integer :start_minute
      t.integer :end_hour
      t.integer :end_minute


      t.timestamps
    end
  end
end
