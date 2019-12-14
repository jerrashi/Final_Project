# == Schema Information
#
# Table name: case_evaluations
#
#  id                   :integer          not null, primary key
#  brainstorming_score  :integer
#  comments             :text
#  contribution_score   :integer
#  evaluator_first_name :string
#  evaluator_last_name  :string
#  feedback             :text
#  group_score          :integer
#  insights_score       :integer
#  student_first_name   :string
#  student_last_name    :string
#  total_score          :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  evaluator_id         :integer
#  student_id           :integer
#

class CaseEvaluation < ApplicationRecord
end
