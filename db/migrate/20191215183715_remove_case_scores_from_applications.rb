class RemoveCaseScoresFromApplications < ActiveRecord::Migration[6.0]
  def change
    remove_column :applications, :case_scores
  end
end
