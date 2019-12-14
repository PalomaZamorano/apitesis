Rails.application.routes.draw do
  
  resources :pregunta
  resources :user_tables
  resources :results_profesors
  resources :curso_profesors
  resources :profesors 
  resources :resultado_encuesta
  resources :cursos
  resources :asignaturas
#Rutas para autenticación del usuario
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'
  #actualizar los promedios de las encuestas por profesor y asignarlos a prof_proms_results
  put 'profesorsupdate_all', to: 'profesors#updateALL'
  #retorna ranking 5 profesores asc según promedio encuestas
  get 'profesorsRanking', to: 'profesors#ranking'
  #Retorna promedio general de los profesores de todo el sistema (supuestamente para informática)
  get 'profesorsPromGeneral', to: 'profesors#PromGeneral'
  #Retorna los promedios de las dimensiones por código de la asignatura o media de la asignatura (para el get de cursos para el profesor)
  get 'resultsGeneral/:result_asign', to: 'resultado_encuesta#resultsGeneral'
  #Retorna los resultados de la encuesta por profesor y año
  get 'profesoresultsAgno/:id/:result_agno', to: 'profesors#resultAgno'
  #Retorna agrupación de los cursos por coordinación y asignatura
  get 'cursoAgroup/:coord', to: 'cursos#cursoAgroup'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
