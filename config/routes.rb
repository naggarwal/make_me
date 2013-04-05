MakeMe::Application.routes.draw do
  
  match '/authentications/no_email' => 'authentications#no_email'
  match '/authentications/create_with_email' =>  'authentications#create_with_email'
  resources :authentications
  
  match '/auth/:provider/callback' => 'authentications#create'
  root :controller => 'lists', :action => :index
  match ':controller(/:action(/:id))(.:format)'
end
