class ProfesorsController < ApplicationController
  before_action :set_profesor, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @profesors = Profesor.order(prof_nombre_corto: :asc)

    render json: @profesors

  end

  def show
    respond_with(@profesor)
  end

  def CursoAgno
    @profesor = Profesor.cursoAgno(params[:id],params[:curso_asign], params[:curso_agno])
    render json: @profesor
  end 

  def Last
    @profesor = Profesor.lastResult(params[:id])
    render json: @profesor
  end 

  
  def cursoLast
    @cursos = Profesor.cursoLast(params[:id],params[:curso_agno], params[:curso_sem])
    @results = Profesor.resultLast(params[:id],params[:curso_agno], params[:curso_sem])
    mer = [@cursos, @results ].as_json
    render json: mer
  end 

  def resultAgno
    @profesor = Profesor.resultAgno(params[:id], params[:result_agno])
    render json: @profesor
  end

  def resultTresAgno
    myprof = Array.new
    @year = Profesor.lastResult(params[:id],params[:result_asign])
    @profesor = Profesor.resultAsignYears(params[:id], params[:result_asign], @year[0])
    @profesor2 = Profesor.resultAsignYears(params[:id], params[:result_asign], @year[0]-1)
    @profesor3 = Profesor.resultAsignYears(params[:id], params[:result_asign], @year[0]-2)
    json = JSON.generate [{"result_nombre" =>@profesor[2],
    "result_prom_general" =>@profesor[0],"result_agno1"=>@profesor[1],
    "result_prom_general1"=>@profesor2[0],"result_agno2"=>@profesor2[1],
    "result_prom_general2"=>@profesor3[0],"result_agno3"=>@profesor3[1]
    
    }]
    render json: json
    
    
  end

  def resultAsign
    @profesor = Profesor.resultAsign(params[:id], params[:result_asign],params[:result_agno] )
    result_total = @profesor.average(:result_total)
  if @profesor.length != 0
    result_promming1 = @profesor.average(:result_promming1)       
    result_promming2 = @profesor.average(:result_promming2)     
    result_promming3 = @profesor.average(:result_promming3)      
    result_promming4 = @profesor.average(:result_promming4)       
    result_prommaxg1 = @profesor.average(:result_prommaxg1)      
    result_prommaxg2 = @profesor.average(:result_prommaxg2)      
    result_prommaxg3 = @profesor.average(:result_prommaxg3)      
    result_prommaxg4 = @profesor.average(:result_prommaxg4)
    result_promg1n   = @profesor.average(:result_promg1n)     
    result_promg2n   = @profesor.average(:result_promg2n)    
    result_promg3n   = @profesor.average(:result_promg3n)    
    result_promg4n   = @profesor.average(:result_promg4n)
    result_prom_general = (result_promg1n + result_promg2n + result_promg3n + result_promg4n)/4
    result_nombre   = @profesor.first.result_nombre


    json = JSON.generate [{"result_prom_general"=>result_prom_general,"result_nombre"=>result_nombre,"result_total"=>result_total, 
    "result_promming1"=>result_promming1,"result_promming2"=>result_promming2,
    "result_promming3"=>result_promming3,"result_promming4"=>result_promming4,"result_prommaxg1"=>result_prommaxg1,
    "result_prommaxg2"=>result_prommaxg2,"result_prommaxg3"=>result_prommaxg3,"result_prommaxg4"=>result_prommaxg4,
    "result_promg1n"=>result_promg1n,"result_promg2n"=>result_promg2n,"result_promg3n"=>result_promg3n,
    "result_promg4n"=>result_promg4n}]
    render json: json
  
  else
    render json: @profesor
  end

  end



#Ranking 5 profesores según promedio de promedios result encuestas hijos
  def ranking
    @profesors = Profesor.rankingModel
    render json: @profesors
  end


  def profsInfo
    @profesors = Profesor.infoProfs
    render json: @profesors
  end 
  
#Promedio del promedio General de todos los profesores del sistema
  def PromGeneral
    profesors = Profesor.infoProfesors
    valor   =  profesors.sum { |x| x["prof_proms_results"] } / profesors.size 
    d1proms =  profesors.sum { |x| x["prof_proms_d1"] } / profesors.size 
    d2proms =  profesors.sum { |x| x["prof_proms_d2"] } / profesors.size
    d3proms =  profesors.sum { |x| x["prof_proms_d3"] } / profesors.size 
    d4proms =  profesors.sum { |x| x["prof_proms_d4"] } / profesors.size
    total_encuestas =  profesors.sum { |x| x["prof_totalEncuestas"] } 
    json = JSON.generate [{"promGeneral"=>valor, "promD1"=>d1proms,
                          "promD2"=>d2proms,"promD3"=>d3proms,"promD4"=>d4proms,"total_encuestas"=>total_encuestas}]  
    render json:json
  end

  def create
    @profesor = Profesor.new(profesor_params)
    @profesor.save
    respond_with(@profesor)
  end

  def update
    @profesor.update(profesor_params)
    respond_with(@profesor)
  end

#Se calcula el promedio de los promedios de los cursos en los que el profesor participa
  def updateALL
    @profesors = Profesor.all
    pg1 = 0
    pg2 = 0
    pg3 = 0
    pg4 = 0
    avr = 0
    sumen = 0
    

    @profesors.each  do |profesor|
      unless  profesor.resultado_encuestums.empty?
        pg1 = profesor.resultado_encuestums.average(:result_promg1n)
        pg2 = profesor.resultado_encuestums.average(:result_promg2n)
        pg3 = profesor.resultado_encuestums.average(:result_promg3n)
        pg4 = profesor.resultado_encuestums.average(:result_promg4n)
        avr = (pg1 + pg2 + pg3 + pg4)/4 
        c1= profesor.cursos.sum(&:curso_aprobados)
        c2= profesor.cursos.sum(&:curso_reprobados)
        sumen = c1+c2
     

        profesor.update_attribute :prof_proms_results,avr
        profesor.update_attribute :prof_proms_d1,pg1
        profesor.update_attribute :prof_proms_d2,pg2
        profesor.update_attribute :prof_proms_d3,pg3
        profesor.update_attribute :prof_proms_d4,pg4
        profesor.update_attribute :prof_totalEncuestas,sumen
      end

    end  
  end  

  def infoProfesors
    @profesor = Profesor.infoProfesors
    render json: @profesor
  end


  def destroy
    @profesor.destroy
    respond_with(@profesor)
  end

  private
    def set_profesor
      @profesor = Profesor.find(params[:id])
    end

    def profesor_params
      params.require(:profesor).permit(:prof_nombre_corto, :if_DUU, :if_pendiente,:prof_proms_d1,:prof_proms_d2,:prof_proms_d3,:prof_proms_d4,:prof_totalEncuestas, :prof_proms_results, :prof_e_mail, :prof_depto, :prof_area, :prof_jornada,:prof_observaciones, :prof_photo)
    end
end
