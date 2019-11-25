class ResultsProfesorsController < ApplicationController
  before_action :set_results_profesor, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @results_profesors = ResultsProfesor.all
    respond_with(@results_profesors)
  end

  def show
    respond_with(@results_profesor)
  end

  def create
    @results_profesor = ResultsProfesor.new(results_profesor_params)
    @results_profesor.save
    respond_with(@results_profesor)
  end

  def update
    @results_profesor.update(results_profesor_params)
    respond_with(@results_profesor)
  end

  def destroy
    @results_profesor.destroy
    respond_with(@results_profesor)
  end

  private
    def set_results_profesor
      @results_profesor = ResultsProfesor.find(params[:id])
    end

    def results_profesor_params
      params.require(:results_profesor).permit(:result_id, :profesor_id)
    end
end
