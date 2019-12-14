# == Schema Information
#
# Table name: projects
#
#  id                 :integer          not null, primary key
#  client             :string
#  description        :text
#  project_label      :string
#  student_email      :string
#  student_first_name :string
#  student_last_name  :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  student_id         :integer
#

class Project < ApplicationRecord
end
