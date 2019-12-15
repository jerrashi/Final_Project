class UpdateProjectModel < ActiveRecord::Migration[6.0]
  def change
    remove_column :projects, :student_email, :student_first_name, :student_last_name
  end
end
