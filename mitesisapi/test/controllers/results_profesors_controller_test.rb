require 'test_helper'

class ResultsProfesorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @results_profesor = results_profesors(:one)
  end

  test "should get index" do
    get results_profesors_url, as: :json
    assert_response :success
  end

  test "should create results_profesor" do
    assert_difference('ResultsProfesor.count') do
      post results_profesors_url, params: { results_profesor: { profesor_id: @results_profesor.profesor_id, result_id: @results_profesor.result_id } }, as: :json
    end

    assert_response 201
  end

  test "should show results_profesor" do
    get results_profesor_url(@results_profesor), as: :json
    assert_response :success
  end

  test "should update results_profesor" do
    patch results_profesor_url(@results_profesor), params: { results_profesor: { profesor_id: @results_profesor.profesor_id, result_id: @results_profesor.result_id } }, as: :json
    assert_response 200
  end

  test "should destroy results_profesor" do
    assert_difference('ResultsProfesor.count', -1) do
      delete results_profesor_url(@results_profesor), as: :json
    end

    assert_response 204
  end
end
