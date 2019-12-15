class RemoveColumnsFromCases < ActiveRecord::Migration[6.0]
  def change
    remove_column :case_evaluations, :evaluator_first_name
    remove_column :case_evaluations, :evaluator_last_name
    remove_column :case_evaluations, :student_first_name
    remove_column :case_evaluations, :student_last_name
    remove_column :case_evaluations, :total_score
  end
end
