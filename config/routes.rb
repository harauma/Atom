Rails.application.routes.draw do
  get '/' => 'home#top'
  get 'login' => 'home#login_form'
  post 'login' => 'home#login'
  get 'logout' => 'home#logout'

  get 'post/index'
  post 'post/approval' => 'post/approval'

  get 't_user/:id/top' => 't_user#top'
  get 't_user/new' => 't_user#new'
  post 't_user/new' => 't_user#create'
  get 't_user/appli' => 't_user#appli'

  get 's_user/new' => 's_user#new'
  post 's_user/new' => 's_user#submit'
  get 's_user/change' => 's_change#chage_form'
  post 's_user/change' => 's_change#change'
  post 's_user/appli/post' => 's_user#post'
  post 's_user/appli/delete' => 's_user#delete'
  get 's_user/applis' => 's_user#applis'
  get 's_user/honban' => 's_user#honban'


  get 'appli/new' => 'appli#new'
  patch 'appli/:id/update' => 'appli#update'
  get 'appli/index' => 'appli#index'
  post 'appli/check' => 'appli#check'
  post 'appli/submit' => 'appli#submit'
  get 'appli/:id/edit' => 'appli#edit'
  post 'appli/:id/post' => 'appli#post'
  post 'appli/delete' => 'appli#delete'
  get 'appli/:id/show' => 'appli#show'
  post 'appli/repost' => 'appli#repost'

  get 'report/index' => 'report#index'
  get 'report/new' => 'report#new'
  get 'report/:id/edit' => 'report#edit'
  get 'report/search' => 'report#search'
  get 'report/:id/show' => 'report#show'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
