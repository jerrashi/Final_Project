Rails.application.routes.draw do

  match("/sign_up", { :controller => "users", :action => "sign_up_form", :via => "get" })
  match("/sign_out", { :controller => "users", :action => "sign_out", :via => "get" })
  match("/sign_in", { :controller => "users", :action => "sign_in", :via => "get" })
  match("/verify_credentials", { :controller => "users", :action => "add_cookie", :via => "get" })
  match("/", { :controller => "application", :action => "home", :via => "get" })

  
# USER ROUTES

  # create
  match("/insert_user_record", {:controller => "users", :action => "create", :via => "post"})
    # was getting no routes matches [GET] /insert_user_record error so implemented fix from stack overflow
    # https://stackoverflow.com/questions/18667326/no-route-matches-get-demo-hello
  get "/insert_user_record" => "users#create"

  # read
  match("/users", {:controller => "users", :action => "index", :via => "get"})
  match("/users/:the_id", {:controller => "users", :action => "profile", :via => "get"})

  # update
  match("/users/:the_id/update_user_record", {:controller => "users", :action => "update", :via => "post"})

  # delete
  match("/users/:the_user_id/delete_user_record", {:controller => "users", :action => "destroy", :via => "get"})

# APPLICATION ROUTES

  # create
  match("/insert_application_record", {:controller => "app", :action => "create", :via => "post"})

  # read
  match("/applications", {:controller => "app", :action => "index", :via => "post"})
  match("/applications/:app_id", {:controller => "app", :action => "profile", :via => "get"})

  # update
  match("/applications/:app_id/update_app_record", {:controller => "app", :action => "update", :via => "post"})

  # delete
  match("/applications/:app_id/delete_app_record", {:controller => "app", :action => "delete", :via => "get"})

  # project routes (BY PROJECT_LABEL)

  # application routes (BY ID)

  # EVALUATION ROUTES

  # "/users/<%= @user.id %>/insert_application_record"

  # ======= Add Your Routes Above These =============
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
