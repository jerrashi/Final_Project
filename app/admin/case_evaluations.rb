ActiveAdmin.register CaseEvaluation do
  permit_params :student_id, :student_first_name, :student_last_name, :evaluator_id, :evaluator_first_name, :total_score, :evaluator_last_name, :contribution_score, :brainstorming_score, :insights_score, :group_score, :comments, :feedback


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
