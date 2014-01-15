require 'test_helper'

class AppDeploymentsControllerTest < ActionController::TestCase
  setup do
    @app_deployment = app_deployments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:app_deployments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create app_deployment" do
    assert_difference('AppDeployment.count') do
      post :create, app_deployment: {  }
    end

    assert_redirected_to app_deployment_path(assigns(:app_deployment))
  end

  test "should show app_deployment" do
    get :show, id: @app_deployment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @app_deployment
    assert_response :success
  end

  test "should update app_deployment" do
    put :update, id: @app_deployment, app_deployment: {  }
    assert_redirected_to app_deployment_path(assigns(:app_deployment))
  end

  test "should destroy app_deployment" do
    assert_difference('AppDeployment.count', -1) do
      delete :destroy, id: @app_deployment
    end

    assert_redirected_to app_deployments_path
  end
end
