# == Schema Information
#
# Table name: applications
#
#  id               :integer          not null, primary key
#  case_scores      :decimal(, )
#  interview_scores :decimal(, )
#  project_label    :string
#  status           :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  student_id       :integer
#

class Application < ApplicationRecord

  def user
    return User.where({:id => self.student_id}).at(0)
  end

  def first_name
    user = self.user
    return user.first_name
  end

  def last_name
    user = self.user
    return user.last_name
  end

  def behavioral_average
    # code from stackoverflow at https://stackoverflow.com/questions/1341271/how-do-i-create-an-average-from-a-ruby-array
    # and activerecord documentation at https://api.rubyonrails.org/classes/ActiveRecord/Calculations.html#method-i-calculate
    arr = self.behavioral_array
    return arr.average(:total_score)
  end

  def case_average
    arr = self.case_array
    return arr.average(:total_score)
  end

  def total_score
    return self.case_average + self.behavioral_average
  end

  def behavioral_array
    return Behavioral_evaluation.where({:student_id => self.student_id})
  end

  def case_array
    return Case_evaluation.where({:student_id => self.student_id})
  end

  # don't forget to delete case_scores and interview_scores
end
