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
    user = User.new

    user.username = params.fetch(:input_username, nil)
    user.password = params.fetch(:input_password)
    user.password_confirmation = params.fetch(:input_password_confirmation)
    user.board = params.fetch(:input_board, FALSE)
    user.date_of_birth = params.fetch(:input_dob, nil)
    user.ethnicity = params.fetch(:input_ethnicity, nil)
    user.first_name = params.fetch(:input_first_name, nil)
    user.gender = params.fetch(:input_gender, nil)
    user.graduation_date = params.fetch(:input_graduation_date, nil)
    user.last_name = params.fetch(:input_last_name, nil)
    user.linkedin = params.fetch(:input_linkedin, nil)
    user.major = params.fetch(:input_major, nil)
    user.subscriber = params.fetch(:input_subscriber, FALSE)

    save_status = user.save
    
    if save_status == true

      session[:user_id] = user.id

      respond_to do |format|
        format.json do
          render({ :json => @user.as_json })
        end

        format.html do
          redirect_to("/users/#{user.id}")
        end
      end
    
    else
      redirect_to("/sign_up", { :alert => "Something went wrong. Please try again."})
    end
  end

  def update
    user = @current_user

    user.username = params.fetch(:input_username, user.username)
    user.date_of_birth = params.fetch(:input_dob, user.date_of_birth)
    user.ethnicity = params.fetch(:input_ethnicity, user.ethnicity)
    user.first_name = params.fetch(:input_first_name, user.first_name)
    user.gender = params.fetch(:input_gender, user.gender)
    user.graduation_date = params.fetch(:input_graduation_date, user.graduation_date)
    user.last_name = params.fetch(:input_last_name, user.last_name)
    user.linkedin = params.fetch(:input_linkedin, user.linkedin)
    user.major = params.fetch(:input_major, user.major)
    user.subscriber = params.fetch(:input_subscriber, user.subscriber)
    user.password = params.fetch(:input_password)
    user.password_confirmation = params.fetch(:input_password_confirmation)

    user.save

    respond_to do |format|
      format.json do
        render({ :json => user.as_json })
      end

      format.html do
        redirect_to("/users/#{user.id}")
      end
    end
  end

  def destroy
    user = @current_user

    user.destroy

    render({ :json => user.as_json })

    redirect_to("/sign_up", { :alert => "Account successfully deleted."})  
  end
end
