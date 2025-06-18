Rails.application.routes.draw do
 
  resources :messages, only: [:create] do
    collection do
      get :chat
    end
  end
  
  #make sure to add the selected_users resource
  namespace :api do
    get 'selected_user', to: 'selected_users#show'
  end
  root 'messages#chat' 
end


