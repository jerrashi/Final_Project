class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.integer :student_id
      t.string :project_label
      t.string :client
      t.string :student_first_name
      t.string :student_last_name
      t.string :student_email
      t.text :description

      t.timestamps
    end
  end
end
