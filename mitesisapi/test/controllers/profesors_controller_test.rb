require 'test_helper'

class ProfesorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @profesor = profesors(:one)
  end

  test "should get index" do
    get profesors_url, as: :json
    assert_response :success
  end

  test "should create profesor" do
    assert_difference('Profesor.count') do
      post profesors_url, params: { profesor: { if_DUU: @profesor.if_DUU, prof_area: @profesor.prof_area, prof_depto: @profesor.prof_depto, prof_e_mail: @profesor.prof_e_mail, prof_jornada: @profesor.prof_jornada, prof_nombre_corto: @profesor.prof_nombre_corto } }, as: :json
    end

    assert_response 201
  end

  test "should show profesor" do
    get profesor_url(@profesor), as: :json
    assert_response :success
  end

  test "should update profesor" do
    patch profesor_url(@profesor), params: { profesor: { if_DUU: @profesor.if_DUU, prof_area: @profesor.prof_area, prof_depto: @profesor.prof_depto, prof_e_mail: @profesor.prof_e_mail, prof_jornada: @profesor.prof_jornada, prof_nombre_corto: @profesor.prof_nombre_corto } }, as: :json
    assert_response 200
  end

  test "should destroy profesor" do
    assert_difference('Profesor.count', -1) do
      delete profesor_url(@profesor), as: :json
    end

    assert_response 204
  end
end
