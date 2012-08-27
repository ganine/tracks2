Tracks2::Application.routes.draw do
  resources :tracks

  root :to => "tracks#index"
end
