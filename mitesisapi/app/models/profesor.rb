class Profesor < ApplicationRecord
   # has_many :cursos , through: :curso_profesors
    #has_many :curso_profesors
    has_and_belongs_to_many :cursos
    has_and_belongs_to_many :resultado_encuestums

    #Se calcula el promedio de los promedios de los cursos en los que el profesor
    #participa
    def self.rankingModel
      @prueba =  Profesor.where("prof_proms_results IS NOT NULL")
      @prueba.limit(5).order('prof_proms_results desc')
     end

    def self.lastResult(id)
     @sem =Profesor.find(id).cursos.maximum(:curso_sem)
     @agno = Profesor.find(id).cursos.maximum(:curso_agno)
     return @agno,@sem
    end  

    def self.cursoLast(id,agno,sem)
      Profesor.find(id).cursos.where(:curso_agno => agno, :curso_sem => sem)
     end 

     def self.resultLast(id,agno,sem)
      Profesor.find(id).resultado_encuestums.where(:result_agno => agno, :result_semestre => sem)
      end 

     def self.resultAgno(id,agno)
      Profesor.find(id).resultado_encuestums.where(:result_agno => agno)
     end 

     def self.resultTresAgno(id,agno)  
      Profesor.find(id).resultado_encuestums.where{ (agno-3) <:result_agno < agno}
     end

     def self.cursoAgno(id,asign,agno)
      Profesor.find(id).cursos.where(:curso_cod => asign, :curso_agno => agno)
     end 

     def self.resultAsign(id,asign, agno)
      Profesor.find(id).resultado_encuestums.where(:result_asign => asign, :result_agno => agno )
     end
    
     def self.infoProfs()
      @profs = Profesor.where(:prof_depto => 'Departamento de Ingeniería Informática')
      @last =  @profs.where('prof_proms_d1 <= 3.5 OR prof_proms_d2 <= 3.5 OR prof_proms_d3 <= 3.5 OR prof_proms_d4 <= 3.5 OR prof_proms_results <= 3.5 ' )
      @last.where("prof_proms_results > 0")
    end

     


  
end
