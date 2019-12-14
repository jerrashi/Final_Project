# == Schema Information
#
# Table name: behavioral_evaluations
#
#  id                   :integer          not null, primary key
#  comments             :text
#  consulting_score     :integer
#  diversity_score      :integer
#  evaluator_first_name :string
#  evaluator_last_name  :string
#  feedback             :text
#  interest_score       :integer
#  student_first_name   :string
#  student_last_name    :string
#  teamwork_score       :integer
#  total_score          :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  evaluator_id         :integer
#  student_id           :integer
#

class BehavioralEvaluation < ApplicationRecord
end
