require 'test_helper'

class TutorDetailsControllerTest < ActionController::TestCase
  setup do
    @tutor_detail = tutor_details(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tutor_details)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tutor_detail" do
    assert_difference('TutorDetail.count') do
      post :create, tutor_detail: { level_id: @tutor_detail.level_id, subject_id: @tutor_detail.subject_id, user_id: @tutor_detail.user_id }
    end

    assert_redirected_to tutor_detail_path(assigns(:tutor_detail))
  end

  test "should show tutor_detail" do
    get :show, id: @tutor_detail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tutor_detail
    assert_response :success
  end

  test "should update tutor_detail" do
    patch :update, id: @tutor_detail, tutor_detail: { level_id: @tutor_detail.level_id, subject_id: @tutor_detail.subject_id, user_id: @tutor_detail.user_id }
    assert_redirected_to tutor_detail_path(assigns(:tutor_detail))
  end

  test "should destroy tutor_detail" do
    assert_difference('TutorDetail.count', -1) do
      delete :destroy, id: @tutor_detail
    end

    assert_redirected_to tutor_details_path
  end
end
