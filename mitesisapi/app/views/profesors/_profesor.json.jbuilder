json.extract! profesor, :id, :prof_nombre_corto, :if_DUU, :if_pendiente,:prof_proms_d1,:prof_proms_d2,:prof_proms_d3,:prof_proms_d4,:prof_totalEncuestas, :prof_proms_results,:prof_e_mail, 
:prof_depto, :prof_area, :prof_jornada,:prof_observaciones, :prof_photo, :created_at, :updated_at
json.url profesor_url(profesor, format: :json)
json.cursos do
    json.array! profesor.cursos, :id, :curso_agno, :curso_sem, :curso_coord, :curso_secc, :curso_elect, :curso_profesores, :curso_aprobados, :curso_reprobados, :curso_promedio, :curso_inscritos, :curso_cod 
    end

json.resultado_encuestum do
    json.array! profesor.resultado_encuestums, :id, :result_profesors, :result_semestre, :result_agno, :result_asign, :result_nombre, :result_total, :result_promming1, :result_promming2, :result_promming3, :result_promming4, :result_prommaxg1, :result_prommaxg2, :result_prommaxg3, 
    :result_prommaxg4, :result_promg1n, :result_promg2n, :result_promg3n, :result_promg4n 
    end

