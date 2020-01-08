class CursoSerializer < ActiveModel::Serializer
attributes :id, :curso_agno, :curso_sem, :curso_coord, :curso_secc, :curso_elect, :curso_profesores, 
:curso_aprobados, :curso_reprobados, :curso_promedio, :curso_inscritos, :curso_cod
belongs_to :profesors
end
