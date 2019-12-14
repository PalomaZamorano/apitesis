require 'test_helper'

class PreguntaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @preguntum = pregunta(:one)
  end

  test "should get index" do
    get pregunta_url, as: :json
    assert_response :success
  end

  test "should create preguntum" do
    assert_difference('Preguntum.count') do
      post pregunta_url, params: { preguntum: { preg_codsign: @preguntum.preg_codsign, preg_max: @preguntum.preg_max, preg_min: @preguntum.preg_min, preg_nombreasign: @preguntum.preg_nombreasign, preg_nropreg: @preguntum.preg_nropreg, preg_pregunta: @preguntum.preg_pregunta, preg_profs: @preguntum.preg_profs, preg_prom: @preguntum.preg_prom, preg_result_id: @preguntum.preg_result_id } }, as: :json
    end

    assert_response 201
  end

  test "should show preguntum" do
    get preguntum_url(@preguntum), as: :json
    assert_response :success
  end

  test "should update preguntum" do
    patch preguntum_url(@preguntum), params: { preguntum: { preg_codsign: @preguntum.preg_codsign, preg_max: @preguntum.preg_max, preg_min: @preguntum.preg_min, preg_nombreasign: @preguntum.preg_nombreasign, preg_nropreg: @preguntum.preg_nropreg, preg_pregunta: @preguntum.preg_pregunta, preg_profs: @preguntum.preg_profs, preg_prom: @preguntum.preg_prom, preg_result_id: @preguntum.preg_result_id } }, as: :json
    assert_response 200
  end

  test "should destroy preguntum" do
    assert_difference('Preguntum.count', -1) do
      delete preguntum_url(@preguntum), as: :json
    end

    assert_response 204
  end
end
