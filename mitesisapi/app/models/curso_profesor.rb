class CursoProfesor < ApplicationRecord
    belongs_to :curso
    belongs_to :profesor
end
