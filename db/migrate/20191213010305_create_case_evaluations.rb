class CreateCaseEvaluations < ActiveRecord::Migration[6.0]
  def change
    create_table :case_evaluations do |t|
      t.integer :student_id
      t.string :student_first_name
      t.string :student_last_name
      t.integer :evaluator_id
      t.string :evaluator_first_name
      t.integer :total_score
      t.string :evaluator_last_name
      t.integer :contribution_score
      t.integer :brainstorming_score
      t.integer :insights_score
      t.integer :group_score
      t.text :comments
      t.text :feedback

      t.timestamps
    end
  end
end
