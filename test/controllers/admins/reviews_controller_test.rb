require 'test_helper'

class Admins::ReviewsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_reviews_index_url
    assert_response :success
  end

  test "should get show" do
    get admins_reviews_show_url
    assert_response :success
  end

  test "should get destroy" do
    get admins_reviews_destroy_url
    assert_response :success
  end

end
