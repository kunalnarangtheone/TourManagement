require 'test_helper'

class ReviewsControllerTest < ActionDispatch::IntegrationTest

  setup do

    # Get fixtures
    @review = reviews(:one)
    @user = users(:one)

  end

  test "should get index" do
    get reviews_url
    assert_response :success
  end

  test "should get new reviews view" do
    get new_review_url
    assert_response :success
  end

  test "should create review" do
    assert_difference('Review.count') do
      post reviews_url, params: { review: {
        content: @review.content,
        subject: @review.subject,
        tour_id: @review.tour_id,
        user_id: @review.user_id
      } }
    end

    assert_redirected_to review_url(Review.last)
  end

  test "should show review" do
    get review_url(@review)
    assert_response :success
  end

  test "should get edit review page" do
    get edit_review_url(@review)
    assert_response :success
  end

  test "should update review" do
    patch review_url(@review), params: { review: { content: @review.content, subject: @review.subject, tour_id: @review.tour_id, user_id: @review.user_id } }
    assert_redirected_to review_url(@review)
  end

  test "should destroy review" do
    assert_difference('Review.count', -1) do
      delete review_url(@review)
    end

    assert_redirected_to reviews_url
  end
end
