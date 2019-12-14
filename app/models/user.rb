# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  board           :boolean
#  date_of_birth   :date
#  ethnicity       :string
#  first_name      :string
#  gender          :string
#  graduation_date :date
#  last_name       :string
#  linkedin        :string
#  major           :string
#  password_digest :string
#  subscriber      :boolean
#  username        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
  has_secure_password
  
  validates(:username, 
    { 
      :presence => true, 
      :uniqueness => { :case_sensitive => false } 
    }
  )

  def applications
    return Application.where({ :applicant_id => self.id })
  end

  def projects
    array_of_project_labels = application.where({ :student_id => self.id, :status => "enrolled"}).pluck(:project_label)
    return Project.where({ :project_label => array_of_project_labels, :student_id => self.id})
  end

end
