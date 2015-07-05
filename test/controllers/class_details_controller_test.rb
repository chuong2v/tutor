require 'test_helper'

class ClassDetailsControllerTest < ActionController::TestCase
  setup do
    @class_detail = class_details(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:class_details)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create class_detail" do
    assert_difference('ClassDetail.count') do
      post :create, class_detail: { level_id: @class_detail.level_id, subject_id: @class_detail.subject_id, user_id: @class_detail.user_id }
    end

    assert_redirected_to class_detail_path(assigns(:class_detail))
  end

  test "should show class_detail" do
    get :show, id: @class_detail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @class_detail
    assert_response :success
  end

  test "should update class_detail" do
    patch :update, id: @class_detail, class_detail: { level_id: @class_detail.level_id, subject_id: @class_detail.subject_id, user_id: @class_detail.user_id }
    assert_redirected_to class_detail_path(assigns(:class_detail))
  end

  test "should destroy class_detail" do
    assert_difference('ClassDetail.count', -1) do
      delete :destroy, id: @class_detail
    end

    assert_redirected_to class_details_path
  end
end
