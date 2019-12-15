class CaseController < BaseController

  def profile
    @case = caseEvaluation.where({ :id => params.fetch(:evaluation_id) }).at(0)

    respond_to do |format|
      format.json do
        render({ :json => @case.as_json })
      end

      format.html do
        render({ :template => "evaluations/case_profile.html.erb" })
      end
    end
  end

  def create
    the_case = CaseEvaluation.new
    application = Application.where({ :id => params.fetch(:app_id)}).at(0)
    if @current_user.board != TRUE
      redirect_to("/applications/#{application.id}", { :alert => "You do not have permission to do that"})
    end

    the_case.application_id = params.fetch(:app_id)
    the_case.evaluator_id = session[:user_id]
    the_case.student_id = application.student_id
    the_case.comments = params.fetch(:input_comments)
    the_case.feedback = params.fetch(:input_feedback)

    the_case.consulting_score = params.fetch(:input_consulting_score)
    the_case.diversity_score = params.fetch(:input_diversity_score)
    the_case.interest_score = params.fetch(:input_interest_score)
    the_case.teamwork_score = params.fetch(:input_teamwork_score)

    save_status = the_case.save
    
    if save_status == true

      respond_to do |format|
        format.json do
          render({ :json => the_case.as_json })
        end

        format.html do
          redirect_to("/applications/#{application.id}", { :notice => "Evaluation successfully submitted."})
        end
      end
    
    
    else
      redirect_to("/applications/#{application.id}", { :alert => "Something went wrong. Please try again."})
    end
  end

  def profile
    @evaluation = CaseEvaluation.where({ :id => params.fetch(:evaluation_id) }).at(0)

    respond_to do |format|
      format.json do
        render({ :json => @evaluation.as_json })
      end

      format.html do
        render({ :template => "evaluations/case_profile.html.erb" })
      end
    end
  end

  def update
    the_case = CaseEvaluation.where({ :id => params.fetch(:evaluation_id)}).at(0)
    application = Application.where({ :id => params.fetch(:app_id)}).at(0)

    if @current_user.board != TRUE or session[:user_id] != evaluation.evaluator_id
      redirect_to("/applications/#{application.id}", { :alert => "You do not have permission to do that"})
    end

    the_case.comments = params.fetch(:input_comments)
    the_case.feedback = params.fetch(:input_feedback)

    the_case.consulting_score = params.fetch(:input_consulting_score)
    the_case.diversity_score = params.fetch(:input_diversity_score)
    the_case.interest_score = params.fetch(:input_interest_score)
    the_case.teamwork_score = params.fetch(:input_teamwork_score)

    respond_to do |format|
      format.json do
        render({ :json => the_case.as_json })
      end

      format.html do
        redirect_to("/applications/#{app.id}/case/#{evaluation.id}", { :notice => "Evaluation successfully updated."})
      end
    end
  end

  def delete
    evaluation = CaseEvaluation.where({ :id => params.fetch(:evaluation_id) }).at(0)

    evaluation.destroy

    redirect_to("/applications/#{app.id}", { :alert => "Evaluation successfully deleted."})  
  end
end