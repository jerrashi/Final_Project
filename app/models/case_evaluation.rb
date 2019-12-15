# == Schema Information
#
# Table name: case_evaluations
#
#  id                  :integer          not null, primary key
#  brainstorming_score :integer
#  comments            :text
#  contribution_score  :integer
#  feedback            :text
#  group_score         :integer
#  insights_score      :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  application_id      :integer
#  evaluator_id        :integer
#  student_id          :integer
#

class CaseEvaluation < ApplicationRecord
  def total_score
    sum = self.brainstorming_score + self.contribution_score + self.group_score + self.insights_score
    return sum
  end

  def student
    return User.where({ :id => self.student_id}).at(0)
  end

  def student_first_name
    return self.student.first_name
  end

  def student_last_name
    return self.student.last_name
  end

  def evaluator
    return User.where({ :id => self.evaluator_id}).at(0)
  end

  def evaluator_first_name
    return self.evaluator.first_name
  end

  def evaluator_last_name
    return self.evaluator.last_name
  end
end
