json.resultado_encuesta resultado_encuestum, :id, :result_semestre, :result_agno, :result_asign, :result_nombre, :result_total, :result_promming1, :result_promming2, :result_promming3, :result_promming4, :result_prommaxg1, :result_prommaxg2, :result_prommaxg3, :result_prommaxg4, :result_promg1, :result_promg2, :result_promg3, :result_promg4, :created_at, :updated_at
json.url resultado_encuestum_url(resultado_encuestum, format: :json)
json.curso do
    json.id resultado_encuestum.curso.id
    json.curso_agno resultado_encuestum.curso.curso_agno
    json.curso_sem resultado_encuestum.curso.curso_sem
    json.curso_coord resultado_encuestum.curso.curso_coord
    json.curso_secc resultado_encuestum.curso.curso_secc
    json.curso_elect resultado_encuestum.curso.curso_elect
    json.curso_profesores resultado_encuestum.curso.curso_profesores
    json.curso_aprobados resultado_encuestum.curso.curso_aprobados
    json.curso_reprobados resultado_encuestum.curso.curso_reprobados
    json.curso_promedio resultado_encuestum.curso.curso_promedio
    json.curso_inscritos resultado_encuestum.curso.curso_inscritos
    json.curso_cod resultado_encuestum.curso.curso_cod
    json.created_at resultado_encuestum.curso.created_at
    json.updated_at resultado_encuestum.curso.updated_at
end
