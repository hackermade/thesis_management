require 'test_helper'

class StudentsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get students_show_url
    assert_response :success
  end

  test "should get new_thesis" do
    get students_new_thesis_url
    assert_response :success
  end

  test "should get create_thesis" do
    get students_create_thesis_url
    assert_response :success
  end

end
