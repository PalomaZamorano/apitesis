class ResultadoEncuestaController < ApplicationController
  before_action :set_resultado_encuestum, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @resultado_encuesta = ResultadoEncuestum.order('created_at ASC')
  end

  def show
    @resultado_encuestum = ResultadoEncuestum.find(params[:id])
    
  end

  
  def resultsGeneral
      
    integer = params[:result_asign].to_i
    @resultado_encuesta = ResultadoEncuestum.where(:result_asign => integer)
    resultadopromd1 = @resultado_encuesta.average(:result_promg1n)
    resultadopromd2 = @resultado_encuesta.average(:result_promg2n)
    resultadopromd3 = @resultado_encuesta.average(:result_promg3n)
    resultadopromd4 = @resultado_encuesta.average(:result_promg4n)
    json = JSON.generate ["promsd1"=>resultadopromd1.round,"promsd2"=>resultadopromd2.round, 
    "promsd3"=>resultadopromd3.round, "promsd4"=>resultadopromd4.round]
    render json: json
  end


#No se debe crear no actualizar ni destruir una encuesta en el aula asociada al curso
  def create
    @resultado_encuestum = ResultadoEncuestum.new(resultado_encuestum_params)
    @resultado_encuestum.save
    respond_with(@resultado_encuestum)
  end

  def update
    @resultado_encuestum.update(resultado_encuestum_params)
    respond_with(@resultado_encuestum)
  end

  def destroy
    @resultado_encuestum.destroy
    respond_with(@resultado_encuestum)
  end

  private
    def set_resultado_encuestum
      @resultado_encuestum = ResultadoEncuestum.find(params[:id])
    end

    def resultado_encuestum_params
      params.require(:resultado_encuestum).permit(:result_semestre, :result_agno, :result_asign, :result_nombre, :result_total, :result_promming1, :result_promming2, :result_promming3, :result_promming4, :result_prommaxg1, :result_prommaxg2, :result_prommaxg3, :result_prommaxg4, :result_promg1n, :result_promg2n, :result_promg3n, :result_promg4n)
    end
end
