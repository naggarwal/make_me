MakeMe::Application.routes.draw do
  devise_for :users
  root :controller => 'list', :action => :index
  match ':controller(/:action(/:id))(.:format)'
end
