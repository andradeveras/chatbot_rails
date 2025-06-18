Rails.application.routes.draw do
 
  resources :messages, only: [:create] do
    collection do
      get :chat
    end
  end
  root 'messages#chat' 
end


