Rails.application.routes.draw do
  get '/auth/:provider/callback', to: 'sessions#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace 'api' do
    namespace 'v1' do
      namespace 'twitter' do
        resources :users, only: [:show]
      end
      resources :tweeters, only: [:index, :show, :create, :destroy]
    end
  end
end
