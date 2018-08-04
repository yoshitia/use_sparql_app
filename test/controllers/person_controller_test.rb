require 'test_helper'

class PersonControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get person_index_url
    assert_response :success
  end

  test "should get show" do
    get person_show_url
    assert_response :success
  end

end
