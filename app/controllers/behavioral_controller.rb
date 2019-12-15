class BehavioralController < BaseController

  def index #index of both behavioral AND case evaluations
    if @current_user.board != TRUE
      redirect_to("/", { :alert => "You do not have permission to view this page."})
    end

    @behaviorals = BehavioralEvaluation.all.order({ :created_at => :desc })
    @cases = CaseEvaluation.all.order({ :created_at => :desc })
    @evaluations = @behaviorals + @cases

    respond_to do |format|
      format.json do
        render({ :json => @evaluations.as_json })
      end

      format.html do
        render({ :template => "evaluations/index.html" })
      end
    end
  end

  def profile
    @behavioral = BehavioralEvaluation.where({ :id => params.fetch(:evaluation_id) }).at(0)

    respond_to do |format|
      format.json do
        render({ :json => @behavioral.as_json })
      end

      format.html do
        render({ :template => "evaluations/behavioral_profile.html.erb" })
      end
    end
  end

  def create
    behavioral = BehavioralEvaluation.new
    application = Application.where({ :id => params.fetch(:app_id)}).at(0)
    if @current_user.board != TRUE
      redirect_to("/applications/#{application.id}", { :alert => "You do not have permission to do that"})
    end

    behavioral.application_id = params.fetch(:app_id)
    behavioral.evaluator_id = session[:user_id]
    behavioral.student_id = application.student_id
    behavioral.comments = params.fetch(:input_comments)
    behavioral.feedback = params.fetch(:input_feedback)

    behavioral.consulting_score = params.fetch(:input_consulting_score)
    behavioral.diversity_score = params.fetch(:input_diversity_score)
    behavioral.interest_score = params.fetch(:input_interest_score)
    behavioral.teamwork_score = params.fetch(:input_teamwork_score)

    save_status = behavioral.save
    
    if save_status == true

      respond_to do |format|
        format.json do
          render({ :json => behavioral.as_json })
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
    @evaluation = BehavioralEvaluation.where({ :id => params.fetch(:evaluation_id) }).at(0)

    respond_to do |format|
      format.json do
        render({ :json => @evaluation.as_json })
      end

      format.html do
        render({ :template => "evaluations/behavioral_profile.html.erb" })
      end
    end
  end

  def update
    behavioral = BehavioralEvaluation.where({ :id => params.fetch(:evaluation_id)}).at(0)
    application = Application.where({ :id => params.fetch(:app_id)}).at(0)

    if @current_user.board != TRUE or session[:user_id] != evaluation.evaluator_id
      redirect_to("/applications/#{application.id}", { :alert => "You do not have permission to do that"})
    end

    behavioral.comments = params.fetch(:input_comments)
    behavioral.feedback = params.fetch(:input_feedback)

    behavioral.consulting_score = params.fetch(:input_consulting_score)
    behavioral.diversity_score = params.fetch(:input_diversity_score)
    behavioral.interest_score = params.fetch(:input_interest_score)
    behavioral.teamwork_score = params.fetch(:input_teamwork_score)

    respond_to do |format|
      format.json do
        render({ :json => behavioral.as_json })
      end

      format.html do
        redirect_to("/applications/#{app.id}/behavioral/#{evaluation.id}", { :notice => "Evaluation successfully updated."})
      end
    end
  end

  def delete
    evaluation = BehavioralEvaluation.where({ :id => params.fetch(:evaluation_id) }).at(0)

    evaluation.destroy

    redirect_to("/applications/#{app.id}", { :alert => "Evaluation successfully deleted."})  
  end
end