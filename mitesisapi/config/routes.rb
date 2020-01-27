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
  #Retorna los resultados de la encuesta por profesor y año
  get 'profesoresultsTresAgno/:id/:result_agno', to: 'profesors#resultTresAgno'
  #Retorna los cursos del profesor según año
  get 'profesoCursoAgno/:id/:curso_asign/:curso_agno', to: 'profesors#CursoAgno'
  #Retorna los cursos del profesor según año
  get 'profsInfo/', to: 'profesors#profsInfo'
  #Retorna los resultados de la encuesta por profesor, codigo asign y año
  get 'profsAsign/:id/:result_asign/:result_agno', to: 'profesors#resultAsign'
  #Retorna los últimos cursos del profesor
  get 'profsLast/:id', to: 'profesors#Last'
  #Retorna los últimos cursos del profesor según semestre y año
  get 'profsLastcurso/:id/:curso_agno/:curso_sem', to: 'profesors#cursoLast'
  #Retorna las preguntas según codigo, coordincación, sección y año
  get 'pregResult/:preg_codsign/:preg_coord/:preg_secc/:preg_agno/:preg_sem/', to: 'pregunta#resultPreg'
  #Retorna resultado encuesta según asignatura, año y semestre
  get 'resultCurso/:result_asign/:result_agno/:result_semestre', to: 'resultado_encuesta#resultCurso'
  #Retorna resultado encuesta que posean valores menor a 3.5 en alguna de las dimensiones
  get 'notiResult/:result_agno/:result_semestre', to: 'resultado_encuesta#notResults'
  #Retorna agrupación de los cursos por coordinación y asignatura
  get 'cursoAgroup/:coord', to: 'cursos#cursoAgroup'
  #Retorna la asignatura según el código
  get 'asigncode/:asign_code' , to: 'asignaturas#asignCode'
  
  #Retorna el usuario si se encuentra registrado
  post 'verification/' , to: 'user_tables#veri'

  #Retorna la asignatura según el código
  get 'cursoProfs/:id' , to: 'cursos#cursoProfs'

  #Retorna las asignaturas del depto de informática
  get 'asignInfo/' , to: 'asignaturas#asignInfo'

  #Retorna los profesores pretenecientes al depto de informática
  get 'profsInfor/', to: 'profesors#infoProfesors'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
