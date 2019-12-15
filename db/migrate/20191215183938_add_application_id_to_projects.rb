class AddApplicationIdToProjects < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :application_id, :integer
  end
end
