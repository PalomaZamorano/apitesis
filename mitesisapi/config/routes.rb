Rails.application.routes.draw do
  resources :results_profesors
  resources :curso_profesors
  resources :profesors 
  resources :resultado_encuesta
  resources :cursos
  resources :asignaturas
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
