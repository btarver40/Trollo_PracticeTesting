Rails.application.routes.draw do
root 'boards#index'

resources :boards do
  resources :lists
end

scope 'tasks/:task_id', as: 'task' do
  resources :boards, only: [:new, :create, :edit, :update]
end
end
