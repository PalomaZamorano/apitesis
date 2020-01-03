class ProfesorsController < ApplicationController
  before_action :set_profesor, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @profesors = Profesor.all
    render json: @profesors

  end

  def show
    respond_with(@profesor)
  end

  def CursoAgno
    @profesor = Profesor.cursoAgno(params[:id],params[:curso_asign], params[:curso_agno])
    render json: @profesor
  end 

  def resultAgno
    @profesor = Profesor.resultAgno(params[:id], params[:result_agno])
    render json: @profesor
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


    json = JSON.generate [{"result_prom_general"=>result_prom_general.round,"result_nombre"=>result_nombre,"result_total"=>result_total, "result_promming1"=>result_promming1,"result_promming2"=>result_promming2,
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

#Promedio del promedio General de todos los profesores del sistema
  def PromGeneral
    valor = Profesor.average(:prof_proms_results) 
    d1proms = Profesor.average(:prof_proms_d1) 
    d2proms = Profesor.average(:prof_proms_d2) 
    d3proms = Profesor.average(:prof_proms_d3) 
    d4proms = Profesor.average(:prof_proms_d4)
    total_encuestas =  Profesor.sum(:prof_totalEncuestas)

    json = JSON.generate [{"promGeneral"=>valor.round, "promD1"=>d1proms.round,
                          "promD2"=>d2proms.round,"promD3"=>d3proms.round,"promD4"=>d4proms.round,"total_encuestas"=>total_encuestas}]  
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
        sumen = profesor.resultado_encuestums.sum(&:result_total)
     

        profesor.update_attribute :prof_proms_results,avr
        profesor.update_attribute :prof_proms_d1,pg1
        profesor.update_attribute :prof_proms_d2,pg2
        profesor.update_attribute :prof_proms_d3,pg3
        profesor.update_attribute :prof_proms_d4,pg4
        profesor.update_attribute :prof_totalEncuestas,sumen
      end

    end  
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
      params.require(:profesor).permit(:prof_nombre_corto, :if_DUU, :if_pendiente,:prof_proms_d1,:prof_proms_d2,:prof_proms_d3,:prof_proms_d4,:prof_totalEncuestas, :prof_proms_results, :prof_e_mail, :prof_depto, :prof_area, :prof_jornada)
    end
end
