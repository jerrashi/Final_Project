class RemoveScoreFromBehavioralEvaluations < ActiveRecord::Migration[6.0]
  def change
    remove_column :behavioral_evaluations, :score
  end
end
