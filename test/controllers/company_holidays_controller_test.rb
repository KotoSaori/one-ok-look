require 'test_helper'

class CompanyHolidaysControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get company_holidays_new_url
    assert_response :success
  end

end
