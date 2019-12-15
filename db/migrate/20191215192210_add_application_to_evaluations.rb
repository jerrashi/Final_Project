class AddApplicationToEvaluations < ActiveRecord::Migration[6.0]
  def change
    add_column :case_evaluations, :application_id, :integer
    add_column :behavioral_evaluations, :application_id, :integer
  end
end
