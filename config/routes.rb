Rails.application.routes.draw do
  namespace :v1 do
    resources :projects do
      resources :steps, module: :project
    end
  end
end
