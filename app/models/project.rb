# == Schema Information
#
# Table name: projects
#
#  id                 :integer          not null, primary key
#  client             :string
#  description        :text
#  project_label      :string
#  student_first_name :string
#  student_last_name  :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  application_id     :integer
#  student_id         :integer
#

class Project < ApplicationRecord
  ## TO BE IMPLEMENTED LATER
  def student
    return User.where({ :id => self.student_id})
  end

  def student_first_name
    return self.student.first_name
  end

  def student_last_name
    return self.student.last_name
  end

  def student_full_name
    return self.student.first_name + " " + self.student.last_name
  end
end
