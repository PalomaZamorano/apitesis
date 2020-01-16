  json.id curso.id
  json.curso_profesores curso.curso_profesores
  json.curso_cod curso.curso_cod
  json.curso_agno curso.curso_agno
  json.curso_sem curso.curso_sem
  json.curso_coord curso.curso_coord
  json.curso_secc curso.curso_secc
  json.curso_elect curso.curso_elect
  json.curso_aprobados curso.curso_aprobados
  json.curso_reprobados curso.curso_reprobados
  json.curso_promedio curso.curso_promedio
  json.curso_inscritos curso.curso_inscritos
  json.created_at curso.created_at
  json.updated_at curso.updated_at
  json.profesors do
    json.array! curso.profesors, :id, :prof_nombre_corto, :if_DUU, :prof_e_mail, :prof_depto, :prof_area, :prof_jornada
    end
 


