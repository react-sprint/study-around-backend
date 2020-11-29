class CreateStudies < ActiveRecord::Migration[6.0]
  def change
    create_table :studies do |t|
      t.references :project

      t.string :start_hour
      t.string :start_minute
      t.string :end_hour
      t.string :end_minute

      t.timestamps
    end
  end
end
