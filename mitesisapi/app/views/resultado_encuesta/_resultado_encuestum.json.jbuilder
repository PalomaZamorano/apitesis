json.resultado_encuesta resultado_encuestum, :id, :result_profesors, :result_semestre, :result_agno, :result_asign, :result_nombre, :result_total, :result_promming1, :result_promming2, :result_promming3, :result_promming4, :result_prommaxg1, :result_prommaxg2, :result_prommaxg3, :result_prommaxg4, :result_promg1n, :result_promg2n, :result_promg3n, :result_promg4n, :created_at, :updated_at
json.url resultado_encuestum_url(resultado_encuestum, format: :json)
json.profesors do
    json.array! resultado_encuestum.profesors, :id, :prof_nombre_corto, :if_DUU, :prof_e_mail, :prof_depto, :prof_area, :prof_jornada
    end
json.preguntas do
  json.array! resultado_encuestum.preguntum, :id, :preg_nropreg, :preg_pregunta, :preg_min, :preg_max, :preg_prom, :preg_profs, :preg_codsign, :preg_nombreasign, :preg_secc,:preg_coord,:preg_agno,:preg_sem
end

