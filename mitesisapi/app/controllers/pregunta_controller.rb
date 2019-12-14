class PreguntaController < ApplicationController
  before_action :set_preguntum, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @pregunta = Preguntum.all
    render json: @pregunta
  end

  def show
    respond_with(@preguntum)
  end

  def create
    @preguntum = Preguntum.new(preguntum_params)
    @preguntum.save
    respond_with(@preguntum)
  end

  def update
    @preguntum.update(preguntum_params)
    respond_with(@preguntum)
  end

  def destroy
    @preguntum.destroy
    respond_with(@preguntum)
  end

  private
    def set_preguntum
      @preguntum = Preguntum.find(params[:id])
    end

    def preguntum_params
      params.require(:preguntum).permit(:preg_nropreg, :preg_pregunta, :preg_min, :preg_max, :preg_prom, :preg_profs, :preg_codsign, :preg_result_id, :preg_nombreasign)
    end
end
