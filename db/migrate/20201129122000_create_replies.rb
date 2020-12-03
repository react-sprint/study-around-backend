class CreateReplies < ActiveRecord::Migration[6.0]
  def change
    create_table :replies do |t|
      t.references :project
      
      t.string :contents
      t.string :auth_date

      t.timestamps
    end
  end
end
