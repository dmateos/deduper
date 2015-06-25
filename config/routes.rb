Rails.application.routes.draw do
  root to: 'pages#index'

  post "check_dupe" => "records#check_dupe"
  post "import_new" => "records#import_new"

  resources :records, only: [ :index ]
end
