class BaseController < ActionController::Base
  before_action(:load_current_user)
  before_action(:force_sign_in)

  def load_current_user
    @current_user = User.where({ :id => session[:user_id] }).at(0)
  end

  def force_sign_in
    if @current_user == nil
      redirect_to("/sign_in", { :alert => "Please log in or sign up to proceed."})  
    end
  end
  
  def home
    render({ :template => "homepage.html.erb" })
  end
end