require "application_system_test_case"

class MaintenanceCarServicesTest < ApplicationSystemTestCase
  setup do
    @maintenance_car_service = maintenance_car_services(:one)
  end

  test "visiting the index" do
    visit maintenance_car_services_url
    assert_selector "h1", text: "Maintenance car services"
  end

  test "should create maintenance car service" do
    visit maintenance_car_services_url
    click_on "New maintenance car service"

    click_on "Create Maintenance car service"

    assert_text "Maintenance car service was successfully created"
    click_on "Back"
  end

  test "should update Maintenance car service" do
    visit maintenance_car_service_url(@maintenance_car_service)
    click_on "Edit this maintenance car service", match: :first

    click_on "Update Maintenance car service"

    assert_text "Maintenance car service was successfully updated"
    click_on "Back"
  end

  test "should destroy Maintenance car service" do
    visit maintenance_car_service_url(@maintenance_car_service)
    click_on "Destroy this maintenance car service", match: :first

    assert_text "Maintenance car service was successfully destroyed"
  end
end
