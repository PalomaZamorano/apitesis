class Curso < ApplicationRecord
    belongs_to :asignatura
    validates :curso_cod, presence: true
    belongs_to :resultado_encuesta
   # has_many :profesors , through: :curso_profesors
    #has_many :curso_profesors
    has_and_belongs_to_many :profesors
end
