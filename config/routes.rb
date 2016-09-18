Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => "reports#index"
  get 'reports/tweets' => 'reports#tweets'
  post '/' => 'reports#create'

end
