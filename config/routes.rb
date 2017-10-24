Rails.application.routes.draw do

  resources :charges, only: [:new, :create] do
    collection do
      delete 'downgrade'
    end
  end

  resources :wikis

  devise_for :users

  get 'about' => 'welcome#about'

  root 'welcome#index'

end
