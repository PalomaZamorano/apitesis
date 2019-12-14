class PreguntumSerializer < ActiveModel::Serializer
  attributes :id, :preg_nropreg, :preg_pregunta, :preg_min, :preg_max, :preg_prom, :preg_profs, :preg_codsign, :preg_nombreasign
  belongs_to :resultado_encuesta
end
