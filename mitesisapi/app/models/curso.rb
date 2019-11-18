class Curso < ApplicationRecord
    belongs_to :asignatura
    validates :curso_cod, presence: true
end
