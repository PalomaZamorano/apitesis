require 'test_helper'

class CursoProfesorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @curso_profesor = curso_profesors(:one)
  end

  test "should get index" do
    get curso_profesors_url, as: :json
    assert_response :success
  end

  test "should create curso_profesor" do
    assert_difference('CursoProfesor.count') do
      post curso_profesors_url, params: { curso_profesor: { curso_id: @curso_profesor.curso_id, profesor_id: @curso_profesor.profesor_id } }, as: :json
    end

    assert_response 201
  end

  test "should show curso_profesor" do
    get curso_profesor_url(@curso_profesor), as: :json
    assert_response :success
  end

  test "should update curso_profesor" do
    patch curso_profesor_url(@curso_profesor), params: { curso_profesor: { curso_id: @curso_profesor.curso_id, profesor_id: @curso_profesor.profesor_id } }, as: :json
    assert_response 200
  end

  test "should destroy curso_profesor" do
    assert_difference('CursoProfesor.count', -1) do
      delete curso_profesor_url(@curso_profesor), as: :json
    end

    assert_response 204
  end
end
