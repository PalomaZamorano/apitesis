class Profesor < ApplicationRecord
   # has_many :cursos , through: :curso_profesors
    #has_many :curso_profesors
    has_and_belongs_to_many :cursos
    has_and_belongs_to_many :resultado_encuestums

    #Se calcula el promedio de los promedios de los cursos en los que el profesor
    #participa
  #  before_update :calculate_avr_cursos


   # private       # <--- at bottom of model
    
    #  def calculate_avr_cursos
     #       avr = self.cursos.average(:curso_promedio)
      #      self.prof_proms_cursos = avr
      #end
end
