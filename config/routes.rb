require 'api_constraint'

Rails.application.routes.draw do
  scope module: :v1, constraints: ApiConstraint.new(version: 1, default: true), defaults: { format: 'json' }  do
    resources :users do
      resources :task_lists
    end
  end
end
