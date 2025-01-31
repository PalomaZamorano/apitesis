class AsignaturasController < ApplicationController
  before_action :set_asignatura, only: [:show, :update, :destroy]

  # GET /asignaturas
  def index
    @asignaturas = Asignatura.all
  end

  # GET /asignaturas/1
  def show
    @asignatura =  Asignatura.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @asignatura.as_json(include: [:cursos]) }
    end
  end

  # POST /asignaturas
  def create
    @asignatura = Asignatura.new(asignatura_params)

    if @asignatura.save
      render json: @asignatura, status: :created, location: @asignatura
    else
      render json: @asignatura.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /asignaturas/1
  def update
    if @asignatura.update(asignatura_params)
      render json: @asignatura
    else
      render json: @asignatura.errors, status: :unprocessable_entity
    end
  end

  # DELETE /asignaturas/1
  def destroy
    @asignatura.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_asignatura
      @asignatura = Asignatura.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def asignatura_params
      params.require(:asignatura).permit(:asign_nombre, :asign_code)

    end





end
