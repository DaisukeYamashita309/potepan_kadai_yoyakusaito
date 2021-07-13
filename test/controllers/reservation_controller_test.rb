require "test_helper"

class ReservationControllerTest < ActionDispatch::IntegrationTest
  test "should get catalog" do
    get reservation_catalog_url
    assert_response :success
  end
end
