class CreateReplies < ActiveRecord::Migration[6.0]
  def change
    create_table :replies do |t|
      t.references :study
      
      t.string :contents

      t.timestamps
    end
  end
end
