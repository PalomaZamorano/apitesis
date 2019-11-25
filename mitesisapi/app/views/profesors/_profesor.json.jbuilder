json.extract! profesor, :id, :prof_nombre_corto, :if_DUU, :if_pendiente, :prof_proms_cursos ,:prof_e_mail, :prof_depto, :prof_area, :prof_jornada, :created_at, :updated_at
json.url profesor_url(profesor, format: :json)
json.cursos do
    json.array! profesor.cursos, :id, :curso_agno, :curso_sem, :curso_coord, :curso_secc, :curso_elect, :curso_profesores, :curso_aprobados, :curso_reprobados, :curso_promedio, :curso_inscritos, :curso_cod 
    end

json.resultado_encuestum do
    json.array! profesor.resultado_encuestums, :id, :result_profesors, :result_semestre, :result_agno, :result_asign, :result_nombre, :result_total, :result_promming1, :result_promming2, :result_promming3, :result_promming4, :result_prommaxg1, :result_prommaxg2, :result_prommaxg3, 
    :result_prommaxg4, :result_promg1, :result_promg2, :result_promg3, :result_promg4 
    end

