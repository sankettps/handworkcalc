require 'test_helper'

class Api::V1::DesignsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_design = api_v1_designs(:one)
  end

  test "should get index" do
    get api_v1_designs_url
    assert_response :success
  end

  test "should get new" do
    get new_api_v1_design_url
    assert_response :success
  end

  test "should create api_v1_design" do
    assert_difference('Api::V1::Design.count') do
      post api_v1_designs_url, params: { api_v1_design: { name: @api_v1_design.name } }
    end

    assert_redirected_to api_v1_design_url(Api::V1::Design.last)
  end

  test "should show api_v1_design" do
    get api_v1_design_url(@api_v1_design)
    assert_response :success
  end

  test "should get edit" do
    get edit_api_v1_design_url(@api_v1_design)
    assert_response :success
  end

  test "should update api_v1_design" do
    patch api_v1_design_url(@api_v1_design), params: { api_v1_design: { name: @api_v1_design.name } }
    assert_redirected_to api_v1_design_url(@api_v1_design)
  end

  test "should destroy api_v1_design" do
    assert_difference('Api::V1::Design.count', -1) do
      delete api_v1_design_url(@api_v1_design)
    end

    assert_redirected_to api_v1_designs_url
  end
end
