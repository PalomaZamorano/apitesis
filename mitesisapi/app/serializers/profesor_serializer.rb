class ProfesorSerializer < ActiveModel::Serializer
  attributes :id, :prof_nombre_corto, :if_DUU, :if_pendiente,:prof_proms_d1,:prof_proms_d2,:prof_proms_d3,:prof_proms_d4,:prof_totalEncuestas,:prof_proms_results, :prof_e_mail, :prof_depto, :prof_area, :prof_jornada
end
