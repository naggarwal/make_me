MakeMe::Application.routes.draw do
  
  resources :authentications
  
  match '/auth/:provider/callback' => 'authentications#create'
  root :controller => 'lists', :action => :index
  match ':controller(/:action(/:id))(.:format)'
end
