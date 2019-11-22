class ProfesorsController < ApplicationController
  before_action :set_profesor, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @profesors = Profesor.all
    respond_with(@profesors)
  end

  def show
    respond_with(@profesor)
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

  def destroy
    @profesor.destroy
    respond_with(@profesor)
  end

  private
    def set_profesor
      @profesor = Profesor.find(params[:id])
    end

    def profesor_params
      params.require(:profesor).permit(:prof_nombre_corto, :if_DUU, :prof_e_mail, :prof_depto, :prof_area, :prof_jornada)
    end
end
