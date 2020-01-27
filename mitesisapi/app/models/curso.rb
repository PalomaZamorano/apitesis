class Curso < ApplicationRecord
    belongs_to :asignatura
    validates :curso_cod, presence: true
   # has_many :profesors , through: :curso_profesors
    #has_many :curso_profesors
    has_and_belongs_to_many :profesors

    def self.cursoProfesors(id)
        Curso.find(id).profesors
    end
    
    def self.restCurso()
        @resultInfo = Curso.where("curso_cod>13000 OR curso_cod=10126 OR curso_cod=10110" )
    end   
end
