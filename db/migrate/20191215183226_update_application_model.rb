class UpdateApplicationModel < ActiveRecord::Migration[6.0]
  def change
    remove_column :applications, :interview_scores, :case_scores
  end
end
