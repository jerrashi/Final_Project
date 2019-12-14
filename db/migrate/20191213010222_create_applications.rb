class CreateApplications < ActiveRecord::Migration[6.0]
  def change
    create_table :applications do |t|
      t.integer :student_id
      t.string :project_label
      t.string :status
      t.decimal :interview_scores
      t.decimal :case_scores

      t.timestamps
    end
  end
end
