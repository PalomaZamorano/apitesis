class ResultsProfesor < ApplicationRecord
    belongs_to :resultado_encuesta
    belongs_to :profesor
end
