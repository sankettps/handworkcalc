require 'test_helper'

class Api::V1::MaterialsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_material = api_v1_materials(:one)
  end

  test "should get index" do
    get api_v1_materials_url
    assert_response :success
  end

  test "should get new" do
    get new_api_v1_material_url
    assert_response :success
  end

  test "should create api_v1_material" do
    assert_difference('Api::V1::Material.count') do
      post api_v1_materials_url, params: { api_v1_material: {  } }
    end

    assert_redirected_to api_v1_material_url(Api::V1::Material.last)
  end

  test "should show api_v1_material" do
    get api_v1_material_url(@api_v1_material)
    assert_response :success
  end

  test "should get edit" do
    get edit_api_v1_material_url(@api_v1_material)
    assert_response :success
  end

  test "should update api_v1_material" do
    patch api_v1_material_url(@api_v1_material), params: { api_v1_material: {  } }
    assert_redirected_to api_v1_material_url(@api_v1_material)
  end

  test "should destroy api_v1_material" do
    assert_difference('Api::V1::Material.count', -1) do
      delete api_v1_material_url(@api_v1_material)
    end

    assert_redirected_to api_v1_materials_url
  end
end
