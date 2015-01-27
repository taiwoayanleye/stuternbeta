require 'test_helper'

class ShortlistingsControllerTest < ActionController::TestCase
  setup do
    @shortlisting = shortlistings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shortlistings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shortlisting" do
    assert_difference('Shortlisting.count') do
      post :create, shortlisting: { company_profile_id: @shortlisting.company_profile_id, student_profile_id: @shortlisting.student_profile_id }
    end

    assert_redirected_to shortlisting_path(assigns(:shortlisting))
  end

  test "should show shortlisting" do
    get :show, id: @shortlisting
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @shortlisting
    assert_response :success
  end

  test "should update shortlisting" do
    patch :update, id: @shortlisting, shortlisting: { company_profile_id: @shortlisting.company_profile_id, student_profile_id: @shortlisting.student_profile_id }
    assert_redirected_to shortlisting_path(assigns(:shortlisting))
  end

  test "should destroy shortlisting" do
    assert_difference('Shortlisting.count', -1) do
      delete :destroy, id: @shortlisting
    end

    assert_redirected_to shortlistings_path
  end
end
