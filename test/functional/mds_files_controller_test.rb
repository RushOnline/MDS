require 'test_helper'

class MdsFilesControllerTest < ActionController::TestCase
  setup do
    @mds_file = mds_files(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mds_files)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mds_file" do
    assert_difference('MdsFile.count') do
      post :create, mds_file: @mds_file.attributes
    end

    assert_redirected_to mds_file_path(assigns(:mds_file))
  end

  test "should show mds_file" do
    get :show, id: @mds_file
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mds_file
    assert_response :success
  end

  test "should update mds_file" do
    put :update, id: @mds_file, mds_file: @mds_file.attributes
    assert_redirected_to mds_file_path(assigns(:mds_file))
  end

  test "should destroy mds_file" do
    assert_difference('MdsFile.count', -1) do
      delete :destroy, id: @mds_file
    end

    assert_redirected_to mds_files_path
  end
end
