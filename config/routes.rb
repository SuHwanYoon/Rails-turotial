Rails.application.routes.draw do
  resources :todos
  resources :projects
  # # 이하는 참고용 경로
  # get "/projects", to: "projects#index"
  # # new project를 추가하는 라우트 지정
  # get "/projects/new", to: "projects#new", as: "new_project"
  # get "/projects/:id", to: "projects#show", as: "project"
  # # project 항목을 edit하는 라우트 지정
  # get "/projects/:id/edit", to: "projects#edit", as: "edit_project"
  # post "/projects", to: "projects#create"
  # # project:id항목을 update하는 patch method rails에서는 put을 거의안쓰고 patch를 씀
  # patch "/projects/:id", to: "projects#update"
  # # delete 경로를 추가
  # delete "/projects/:id", to: "projects#destroy"




  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  root "projects#index"
end
