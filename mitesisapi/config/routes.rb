Rails.application.routes.draw do
  resources :results_profesors
  resources :curso_profesors
  resources :profesors 
  resources :resultado_encuesta
  resources :cursos
  resources :asignaturas
  #actualizar los promedios de las encuestas por profesor y asignarlos a prof_proms_results
  put 'profesorsupdate_all', to: 'profesors#updateALL'
  #retorna ranking 5 profesores asc según promedio encuestas
  get 'profesorsRanking', to: 'profesors#ranking'
  #Retorna promedio general de los profesores de todo el sistema (supuestamente para informática)
  get 'profesorsPromGeneral', to: 'profesors#PromGeneral'
  #Retorna promedio dimensiones de los profesores de todo el sistema (supuestamente para informática)
  get 'profesorsPromDimensiones', to: 'profesors#PromDimensiones'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
