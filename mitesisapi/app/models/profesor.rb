class Profesor < ApplicationRecord
   # has_many :cursos , through: :curso_profesors
    #has_many :curso_profesors
    has_and_belongs_to_many :cursos
    has_and_belongs_to_many :resultado_encuestums

    #Se calcula el promedio de los promedios de los cursos en los que el profesor
    #participa
    def self.rankingModel
      @prueba =  Profesor.infoProfesors
      @prueba1 =  @prueba.sort_by! { |x| x.prof_proms_results }
      @fin = @prueba1.last(5)
      @fin.reverse
     end

     def self.rankingModelCivil
      @prueba =  Profesor.civilProfesors
      @prueba1 =  @prueba.sort_by! { |x| x.prof_proms_results }
      @fin = @prueba1.last(5)
      @fin.reverse
     end
     
     def self.rankingModelEjecu
      @prueba =  Profesor.ejecuProfesors
      @prueba1 =  @prueba.sort_by! { |x| x.prof_proms_results }
      @fin = @prueba1.last(5)
      @fin.reverse
     end

    def self.lastResult(id,curso_cod)
     @sem =Profesor.find(id).cursos.where(:curso_cod => curso_cod).maximum(:curso_sem)
     @agno = Profesor.find(id).cursos.where(:curso_cod => curso_cod).maximum(:curso_agno)
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

     def addPost (newPost)
      #Here I try to add an object blog, post an array of objects
              @post.push(newPost)
      end

     def self.resultAsignYear(id,asign)
      Profesor.new
      @year  = Profesor.lastResult(id)
      Profesor.find(id).resultado_encuestums.where(:result_asign => asign, :result_agno => @year[0] )
      
     end
    
     def self.infoProfs()
      @profs = Profesor.where(:prof_depto => 'Departamento de Ingeniería Informática')
      @last =  @profs.where('prof_proms_d1 <= 3.5 OR prof_proms_d2 <= 3.5 OR prof_proms_d3 <= 3.5 OR prof_proms_d4 <= 3.5 OR prof_proms_results <= 3.5 ' )
      @last.where("prof_proms_results > 0")
    end


    def self.infoProfesors()
      @profs = Profesor.joins(:cursos).where("curso_cod>13000 OR curso_cod=10126 OR curso_cod=10110")
      @cosa = @profs.uniq
    end  

    def self.civilProfesors()
      @profs = Profesor.joins(:cursos).where("curso_cod>13000 OR curso_cod=10126 OR curso_cod=10110")
      @profs2 = @profs.where("curso_cod=10126 OR curso_cod=10126 OR curso_cod=10110 OR
      curso_cod=13201 OR curso_cod=13204 OR curso_cod=13205 OR curso_cod=13209 OR curso_cod=13210 OR
      curso_cod=13212 OR curso_cod=13213 OR curso_cod=13214 OR curso_cod=13215 OR curso_cod=13217 OR
      curso_cod=13219 OR curso_cod=13220 OR curso_cod=13221 OR curso_cod=13222 OR curso_cod=13223 OR
      curso_cod=13224 OR curso_cod=13225 OR curso_cod=13226 OR curso_cod=13227 OR curso_cod=13228 OR
      curso_cod=13229 OR curso_cod=13231 OR curso_cod=13232 OR curso_cod=13233 OR curso_cod=13234 OR
      curso_cod=13235 OR curso_cod=13236 OR curso_cod=13237 OR curso_cod=13238 OR curso_cod=13239 OR
      curso_cod=13266 OR curso_cod=13267 OR curso_cod=13268 OR curso_cod=13269 OR curso_cod=13270 OR
      curso_cod=13274 OR curso_cod=13275 OR curso_cod=13278 OR curso_cod=13280 OR curso_cod=13281 OR
      curso_cod=13282 OR curso_cod=13283 OR curso_cod=13284 OR curso_cod=13285 OR curso_cod=13251 OR
      curso_cod=13252 OR curso_cod=13255 OR curso_cod=13230")  
      @cosa = @profs2.uniq
    end  

    def self.ejecuProfesors()
      @profs = Profesor.joins(:cursos).where("curso_cod>13000 OR curso_cod=10126 OR curso_cod=10110")
      @profs2 = @profs.where("curso_cod=10126 OR curso_cod=10126 OR curso_cod=10110 OR
      curso_cod=13201 OR curso_cod=13204 OR curso_cod=13205 OR curso_cod=13209 OR curso_cod=13212 OR 
      curso_cod=13229 OR curso_cod=13231 OR curso_cod=13232 OR curso_cod=13233 OR 
      curso_cod=13252 OR curso_cod=13256 OR curso_cod=13260 OR curso_cod=13261 OR curso_cod=13262 OR
      curso_cod=13265 OR curso_cod=13267 OR curso_cod=13268 OR curso_cod=13269 OR curso_cod=13270 OR
      curso_cod=13273 OR curso_cod=13274 OR curso_cod=13275 OR curso_cod=13276 OR curso_cod=13278 OR  
      curso_cod=13279 OR curso_cod=13280 OR curso_cod=13281" )   
      @cosa = @profs2.uniq
    end  

     

  def self.resultAsignYears(id,result_asign,result_agno)
    @profesor = Profesor.resultAsign(id,result_asign,result_agno)
    result_total = @profesor.average(:result_total)
    if @profesor.length != 0
    
      result_promg1n   = @profesor.average(:result_promg1n)     
      result_promg2n   = @profesor.average(:result_promg2n)    
      result_promg3n   = @profesor.average(:result_promg3n)    
      result_promg4n   = @profesor.average(:result_promg4n)
      result_prom_general = (result_promg1n + result_promg2n + result_promg3n + result_promg4n)/4
      result_nombre   = @profesor.first.result_nombre
      result_agno   = @profesor.first.result_agno
      return result_prom_general,result_agno,result_nombre
  else
    @profesor
  end

  end  


  
end
