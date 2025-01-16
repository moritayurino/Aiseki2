require "test_helper"

class Admin::DashboardsrailsControllerTest < ActionDispatch::IntegrationTest
  test "should get s" do
    get admin_dashboardsrails_s_url
    assert_response :success
  end
end
