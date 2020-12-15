class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      
      t.string :name
      t.string :introduce
      t.string :authorization_password, unique: true #유저가 만들 수 있게 링크가 되게 # unique 분기처리 number로 
      t.integer :manager_user_id
      t.string :manager_introduce
      # t.string :link

      # t.string :wday  # array 형태로 저장됨 # 삭제
      t.integer :start_hour
      t.integer :start_minute
      t.integer :end_hour
      t.integer :end_minute


      t.timestamps
    end
  end
end
