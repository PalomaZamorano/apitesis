json.extract! profesor, :id, :prof_nombre_corto, :if_DUU, :prof_e_mail, :prof_depto, :prof_area, :prof_jornada, :created_at, :updated_at
json.url profesor_url(profesor, format: :json)
json.cursos do
    json.array! profesor.cursos, :id, :curso_agno, :curso_sem, :curso_coord, :curso_secc, :curso_elect, :curso_profesores, :curso_aprobados, :curso_reprobados, :curso_promedio, :curso_inscritos, :curso_cod
    end
