class CursoProfesorsController < ApplicationController
  before_action :set_curso_profesor, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @curso_profesors = CursoProfesor.all
    respond_with(@curso_profesors)
  end

  def show
    respond_with(@curso_profesor)
  end

  def create
    @curso_profesor = CursoProfesor.new(curso_profesor_params)
    @curso_profesor.save
    respond_with(@curso_profesor)
  end

  def update
    @curso_profesor.update(curso_profesor_params)
    respond_with(@curso_profesor)
  end

  def destroy
    @curso_profesor.destroy
    respond_with(@curso_profesor)
  end

  private
    def set_curso_profesor
      @curso_profesor = CursoProfesor.find(params[:id])
    end

    def curso_profesor_params
      params.require(:curso_profesor).permit(:curso_id, :profesor_id)
    end
end
