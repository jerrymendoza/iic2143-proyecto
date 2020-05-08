require 'test_helper'

class LikesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @like = likes(:one)
  end

  test "should get index" do
    get likes_url
    assert_response :success
  end

  test "should get new" do
    get new_like_url
    assert_response :success
  end

  test "should create like" do
    assert_difference('Like.count') do
      post likes_url, params: { like: { match: @like.match, matcher_1: @like.matcher_1, matcher_2: @like.matcher_2 } }
    end

    assert_redirected_to like_url(Like.last)
  end

  test "should show like" do
    get like_url(@like)
    assert_response :success
  end

  test "should get edit" do
    get edit_like_url(@like)
    assert_response :success
  end

  test "should update like" do
    patch like_url(@like), params: { like: { match: @like.match, matcher_1: @like.matcher_1, matcher_2: @like.matcher_2 } }
    assert_redirected_to like_url(@like)
  end

  test "should destroy like" do
    assert_difference('Like.count', -1) do
      delete like_url(@like)
    end

    assert_redirected_to likes_url
  end
end
