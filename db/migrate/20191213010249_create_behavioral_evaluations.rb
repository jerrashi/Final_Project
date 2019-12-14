class CreateBehavioralEvaluations < ActiveRecord::Migration[6.0]
  def change
    create_table :behavioral_evaluations do |t|
      t.integer :student_id
      t.string :student_first_name
      t.string :student_last_name
      t.integer :evaluator_id
      t.string :evaluator_first_name
      t.integer :interest_score
      t.integer :teamwork_score
      t.integer :consulting_score
      t.integer :diversity_score
      t.integer :total_score
      t.string :evaluator_last_name
      t.integer :score
      t.text :comments
      t.text :feedback

      t.timestamps
    end
  end
end
