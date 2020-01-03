class Profesor < ApplicationRecord
   # has_many :cursos , through: :curso_profesors
    #has_many :curso_profesors
    has_and_belongs_to_many :cursos
    has_and_belongs_to_many :resultado_encuestums

    #Se calcula el promedio de los promedios de los cursos en los que el profesor
    #participa
    def self.rankingModel
      Profesor.limit(5).order('prof_proms_results asc')
     end

     def self.resultAgno(id,agno)
      Profesor.find(id).resultado_encuestums.where(:result_agno => agno)
     end 

     def self.cursoAgno(id,asign,agno)
      Profesor.find(id).cursos.where(:curso_cod => asign, :curso_agno => agno)
     end 

     def self.resultAsign(id,asign, agno)
      Profesor.find(id).resultado_encuestums.where(:result_asign => asign, :result_agno => agno )
     end


  
end
