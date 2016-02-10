Rails.application.routes.draw do
  resources :users, defaults: { format: 'json' } do
    resources :task_lists
  end
end
