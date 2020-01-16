  json.id asignatura.id
  json.asign_nombre asignatura.asign_nombre
  json.asign_code asignatura.asign_code
  json.asign_coordinadores asignatura.asign_coordinadores
  json.created_at asignatura.created_at
  json.updated_at asignatura.updated_at
  json.url asignatura_url(asignatura, format: :json)
    json.cursos do
    json.array! asignatura.cursos, :id, :curso_agno, :curso_sem, :curso_coord, 
    :curso_secc,:curso_elect, :curso_profesores, :curso_aprobados, :curso_reprobados, :curso_promedio, 
    :curso_inscritos, :curso_cod, :created_at, :updated_at
    end