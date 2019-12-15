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
  match("/insert_application_record", {:controller => "application", :action => "create", :via => "post"})
  get "/insert_application_record" => "application#create"

  # read
  match("/applications", {:controller => "application", :action => "index", :via => "get"})
  match("/applications/:app_id", {:controller => "application", :action => "profile", :via => "get"})

  # update
  match("/applications/:app_id/update_app_record", {:controller => "application", :action => "update", :via => "post"})

  # delete
  match("/applications/:app_id/delete_app_record", {:controller => "application", :action => "delete", :via => "get"})

# BEHAVIORAL ROUTES
  # create
  match("/applications/:app_id/insert_behavioral", {:controller => "behavioral", :action => "create", :via => "post"})
  get "/applications/:app_id/insert_behavioral" => "behavioral#create"

  # read
  match("/evaluations", {:controller => "behavioral", :action => "index", :via => "get"})
  match("/applications/:app.id/behavioral/:evaluation_id", {:controller => "behavioral", :action => "profile", :via => "get"})
  get "/applications/:app_id/behavioral/:evaluation_id" => "behavioral#profile"

  # update # NOT PROPERLY IMPLEMENTED
  match("/applications/:app.id/behavioral/:evaluation_id/update_evaluation", {:controller => "behavioral", :action => "update", :via => "post"})

  # delete # NOT PROPERLY IMPLEMENTED
  match("/applications/:app.id/behavioral/:evaluation_id/delete_evaluation", {:controller => "behavioral", :action => "delete", :via => "get"})

# CASE ROUTES
  # create
  match("/applications/:app_id/insert_case", {:controller => "case", :action => "create", :via => "post"})
  get "/applications/:app_id/insert_case" => "case#create"

  # read
  match("/applications/:app.id/case/:evaluation_id", {:controller => "case", :action => "profile", :via => "get"})
  get "/applications/:app_id/case/:evaluation_id" => "case#profile"

  # update # NOT PROPERLY IMPLEMENTED
  match("/applications/:app.id/case/:evaluation_id/update_evaluation", {:controller => "case", :action => "update", :via => "post"})

  # delete # NOT PROPERLY IMPLEMENTED
  match("/applications/:app.id/case/:evaluation_id/delete_evaluation", {:controller => "case", :action => "delete", :via => "get"})

  # ======= Add Your Routes Above These =============
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
