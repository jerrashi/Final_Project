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
    return Application.where({ :student_id => self.id })
  end
  
  def most_recent_application
    return self.applications.order({ :created_at => :desc }).at(0)
  end

  def projects
    array_of_project_labels = Application.where({ :student_id => self.id, :status => "enrolled"}).pluck(:project_label)
    return Project.where({ :project_label => array_of_project_labels, :student_id => self.id})
  end


  def most_recent_project
    return self.projects.order({ :created_at => :desc }).at(0)
  end

end
