require 'test_helper'

class ResultadoEncuestaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @resultado_encuestum = resultado_encuesta(:one)
  end

  test "should get index" do
    get resultado_encuesta_url, as: :json
    assert_response :success
  end

  test "should create resultado_encuestum" do
    assert_difference('ResultadoEncuestum.count') do
      post resultado_encuesta_url, params: { resultado_encuestum: { result_agno: @resultado_encuestum.result_agno, result_asign: @resultado_encuestum.result_asign, result_nombre: @resultado_encuestum.result_nombre, result_promg1: @resultado_encuestum.result_promg1, result_promg2: @resultado_encuestum.result_promg2, result_promg3: @resultado_encuestum.result_promg3, result_promg4: @resultado_encuestum.result_promg4, result_prommaxg1: @resultado_encuestum.result_prommaxg1, result_prommaxg2: @resultado_encuestum.result_prommaxg2, result_prommaxg3: @resultado_encuestum.result_prommaxg3, result_prommaxg4: @resultado_encuestum.result_prommaxg4, result_promming1: @resultado_encuestum.result_promming1, result_promming2: @resultado_encuestum.result_promming2, result_promming3: @resultado_encuestum.result_promming3, result_promming4: @resultado_encuestum.result_promming4, result_semestre: @resultado_encuestum.result_semestre, result_total: @resultado_encuestum.result_total } }, as: :json
    end

    assert_response 201
  end

  test "should show resultado_encuestum" do
    get resultado_encuestum_url(@resultado_encuestum), as: :json
    assert_response :success
  end

  test "should update resultado_encuestum" do
    patch resultado_encuestum_url(@resultado_encuestum), params: { resultado_encuestum: { result_agno: @resultado_encuestum.result_agno, result_asign: @resultado_encuestum.result_asign, result_nombre: @resultado_encuestum.result_nombre, result_promg1: @resultado_encuestum.result_promg1, result_promg2: @resultado_encuestum.result_promg2, result_promg3: @resultado_encuestum.result_promg3, result_promg4: @resultado_encuestum.result_promg4, result_prommaxg1: @resultado_encuestum.result_prommaxg1, result_prommaxg2: @resultado_encuestum.result_prommaxg2, result_prommaxg3: @resultado_encuestum.result_prommaxg3, result_prommaxg4: @resultado_encuestum.result_prommaxg4, result_promming1: @resultado_encuestum.result_promming1, result_promming2: @resultado_encuestum.result_promming2, result_promming3: @resultado_encuestum.result_promming3, result_promming4: @resultado_encuestum.result_promming4, result_semestre: @resultado_encuestum.result_semestre, result_total: @resultado_encuestum.result_total } }, as: :json
    assert_response 200
  end

  test "should destroy resultado_encuestum" do
    assert_difference('ResultadoEncuestum.count', -1) do
      delete resultado_encuestum_url(@resultado_encuestum), as: :json
    end

    assert_response 204
  end
end
