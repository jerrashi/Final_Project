class ApplicationController < BaseController

  def index
    if @current_user.board != TRUE
      redirect_to("/", { :alert => "You do not have permission to view this page."})
    end

    @apps = Application.all.order({ :created_at => :desc })

    respond_to do |format|
      format.json do
        render({ :json => @apps.as_json })
      end

      format.html do
        render({ :template => "applications/index.html" })
      end
    end
  end

  def profile
    @app = Application.where({ :id => params.fetch(:app_id) }).at(0)

    respond_to do |format|
      format.json do
        render({ :json => @app.as_json })
      end

      format.html do
        render({ :template => "applications/profile.html.erb" })
      end
    end
  end

  def create
    application = Application.new

    application.student_id = session[:user_id]
    application.project_label = params.fetch(:input_project_label, nil)

    save_status = application.save
    
    if save_status == true

      respond_to do |format|
        format.json do
          render({ :json => application.as_json })
        end

        format.html do
          redirect_to("/applications/#{application.id}", { :notice => "Application successfully submitted."})
        end
      end
    
    
    else
      redirect_to("/users/#{session[:user_id]}", { :alert => "Something went wrong. Please try again."})
    end
  end

  def update
    app = Application.where({ :id => params.fetch(:app_id) }).at(0)

    app.project_label = params.fetch(:input_project_label, app.project_label)
    app.status = params.fetch(:input_status, app.status)

    app.save

    respond_to do |format|
      format.json do
        render({ :json => app.as_json })
      end

      format.html do
        redirect_to("/applications/#{app.id}", { :alert => "Application successfully deleted."})
      end
    end
  end

  def destroy
    app = Application.where({ :id => params.fetch(:app_id) }).at(0)

    app.destroy

    render({ :json => app.as_json })

    redirect_to("/applications/#{app.id}", { :alert => "Application successfully deleted."})  
  end
end