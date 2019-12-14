Rails.application.routes.draw do

  match("/sign_up", { :controller => "users", :action => "sign_up_form", :via => "get" })
  match("/sign_out", { :controller => "users", :action => "sign_out", :via => "get" })
  match("/sign_in", { :controller => "users", :action => "sign_in", :via => "get" })
  match("/verify_credentials", { :controller => "users", :action => "add_cookie", :via => "get" })
  match("/", { :controller => "users", :action => "home", :via => "get" })

  
  # User routes

  # CREATE
  match("/insert_user_record", {:controller => "users", :action => "create", :via => "post"})

  # READ
  match("/users", {:controller => "users", :action => "index", :via => "get"})
  match("/users/:the_id", {:controller => "users", :action => "profile", :via => "get"})
  match("/users/:the_id/applications", {:controller => "users", :action => "applications", :via => "get"})
  match("/users/:the_id/projects", {:controller => "users", :action => "projects", :via => "get"})

  # UPDATE
  match("/users/:the_id/update_user_record", {:controller => "users", :action => "update", :via => "post"})

  # DELETE
  match("/users/:the_user_id/delete_user_record", {:controller => "users", :action => "destroy", :via => "get"})

  # project routes (BY PROJECT_LABEL)

  # application routes (BY ID)

  "/users/<%= @user.id %>/insert_application_record"

  # ======= Add Your Routes Above These =============
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
