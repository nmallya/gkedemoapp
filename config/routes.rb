Rails.application.routes.draw do
  get 'dogs/index' => 'dogs#index'

  get 'welcome/index'
  get '/_health' => 'health_check#check'
  root :to => 'welcome#index' 
end
