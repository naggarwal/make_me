MakeMe::Application.routes.draw do
  
  root :controller => 'list', :action => :index
  match ':controller(/:action(/:id))(.:format)'
end
