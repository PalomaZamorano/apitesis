class ProfesorSerializer < ActiveModel::Serializer
  attributes :id, :prof_nombre_corto, :if_DUU, :prof_e_mail, :prof_depto, :prof_area, :prof_jornada
end
