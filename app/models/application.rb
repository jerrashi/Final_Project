# == Schema Information
#
# Table name: applications
#
#  id            :integer          not null, primary key
#  project_label :string
#  status        :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  student_id    :integer
#

class Application < ApplicationRecord

  def student
    return User.where({:id => self.student_id}).at(0)
  end

  def first_name
    student = self.student
    return student.first_name
  end

  def last_name
    student = self.student
    return student.last_name
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
    if self.case_average != nil and self.behavioral_average != nil
      return self.case_average + self.behavioral_average
    else
      return 0
    end
  end

  def behavioral_array
    return BehavioralEvaluation.where({:student_id => self.student_id})
  end

  def case_array
    return CaseEvaluation.where({:student_id => self.student_id})
  end
  
end
