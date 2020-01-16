class ResultadoEncuestumSerializer < ActiveModel::Serializer
  attributes :id, :result_semestre, :result_agno, :result_asign, :result_nombre, :result_total, :result_promming1, :result_promming2, :result_promming3, :result_promming4, :result_prommaxg1, :result_prommaxg2, :result_prommaxg3, :result_prommaxg4, :result_promg1n, :result_promg2n, :result_promg3n, :result_promg4n
  belongs_to :profesors
  belongs_to :preguntum
end
