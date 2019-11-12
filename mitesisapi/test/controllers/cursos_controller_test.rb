require 'test_helper'

class CursosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @curso = cursos(:one)
  end

  test "should get index" do
    get cursos_url, as: :json
    assert_response :success
  end

  test "should create curso" do
    assert_difference('Curso.count') do
      post cursos_url, params: { curso: { curso_agno: @curso.curso_agno, curso_aprobados: @curso.curso_aprobados, curso_cod: @curso.curso_cod, curso_coord: @curso.curso_coord, curso_elect: @curso.curso_elect, curso_inscritos: @curso.curso_inscritos, curso_profesores: @curso.curso_profesores, curso_promedio: @curso.curso_promedio, curso_reprobados: @curso.curso_reprobados, curso_secc: @curso.curso_secc, curso_sem: @curso.curso_sem } }, as: :json
    end

    assert_response 201
  end

  test "should show curso" do
    get curso_url(@curso), as: :json
    assert_response :success
  end

  test "should update curso" do
    patch curso_url(@curso), params: { curso: { curso_agno: @curso.curso_agno, curso_aprobados: @curso.curso_aprobados, curso_cod: @curso.curso_cod, curso_coord: @curso.curso_coord, curso_elect: @curso.curso_elect, curso_inscritos: @curso.curso_inscritos, curso_profesores: @curso.curso_profesores, curso_promedio: @curso.curso_promedio, curso_reprobados: @curso.curso_reprobados, curso_secc: @curso.curso_secc, curso_sem: @curso.curso_sem } }, as: :json
    assert_response 200
  end

  test "should destroy curso" do
    assert_difference('Curso.count', -1) do
      delete curso_url(@curso), as: :json
    end

    assert_response 204
  end
end
