class RemoveColumnsFromBehaviorals < ActiveRecord::Migration[6.0]
  def change
    remove_column :behavioral_evaluations, :evaluator_first_name
    remove_column :behavioral_evaluations, :evaluator_last_name
    remove_column :behavioral_evaluations, :student_first_name
    remove_column :behavioral_evaluations, :student_last_name
    remove_column :behavioral_evaluations, :total_score
  end
end
