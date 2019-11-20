Rails.application.routes.draw do
  get 't_user/:id/top' => 't_user#top'
  get 't_user/new' => 't_user#new'
  get 's_user/:id/top' => 's_user#top'
  get 's_user/new' => 's_user#new'
  get 's_user/change' => 's_change#chage_form'
  post 's_user/change' => 's_change#change'
  get '/' => 'home#top'
  get 'home/top' => 'home#top'
  get 'login' => 'home#login_form'
  post 'login' => 'home#login'
  get 'appli/new' => 'appli#new'
  get 'appli/index' => 'appli#index'
  post 'appli/check' => 'appli#check'
  post 'appli/submit' => 'appli#submit'
  get 'appli/:id/edit' => 'appli#edit'
  get 'report/new' => 'report#new'
  get 'report/:id/edit' => 'report#edit'
  get 'report/search' => 'report#search'
  get 'report/:id/show' => 'report#show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
