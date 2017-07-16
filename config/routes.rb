Rails.application.routes.draw do
  get 'welcome/index'
  get '/_health' => 'health_check#check'
  root :to => 'welcome#index' 
end
