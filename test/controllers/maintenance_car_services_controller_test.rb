require "test_helper"

class MaintenanceCarServicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @maintenance_car_service = maintenance_car_services(:one)
  end

  test "should get index" do
    get maintenance_car_services_url
    assert_response :success
  end

  test "should get new" do
    get new_maintenance_car_service_url
    assert_response :success
  end

  test "should create maintenance_car_service" do
    assert_difference("MaintenanceCarService.count") do
      post maintenance_car_services_url, params: { maintenance_car_service: {} }
    end

    assert_redirected_to maintenance_car_service_url(MaintenanceCarService.last)
  end

  test "should show maintenance_car_service" do
    get maintenance_car_service_url(@maintenance_car_service)
    assert_response :success
  end

  test "should get edit" do
    get edit_maintenance_car_service_url(@maintenance_car_service)
    assert_response :success
  end

  test "should update maintenance_car_service" do
    patch maintenance_car_service_url(@maintenance_car_service), params: { maintenance_car_service: {} }
    assert_redirected_to maintenance_car_service_url(@maintenance_car_service)
  end

  test "should destroy maintenance_car_service" do
    assert_difference("MaintenanceCarService.count", -1) do
      delete maintenance_car_service_url(@maintenance_car_service)
    end

    assert_redirected_to maintenance_car_services_url
  end
end
