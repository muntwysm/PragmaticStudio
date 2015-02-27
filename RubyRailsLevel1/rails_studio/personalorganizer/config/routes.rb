Rails.application.routes.draw do
  #specifying http verb get 
  get 'todolist' => 'todolist#index'
end
