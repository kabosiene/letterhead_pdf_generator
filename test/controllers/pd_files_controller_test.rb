require 'test_helper'

class PdFilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pd_file = pd_files(:one)
  end

  test "should get index" do
    get pd_files_url
    assert_response :success
  end

  test "should get new" do
    get new_pd_file_url
    assert_response :success
  end

  test "should create pd_file" do
    assert_difference('PdFile.count') do
      post pd_files_url, params: { pd_file: { file_name: @pd_file.file_name } }
    end

    assert_redirected_to pd_file_url(PdFile.last)
  end

  test "should show pd_file" do
    get pd_file_url(@pd_file)
    assert_response :success
  end

  test "should get edit" do
    get edit_pd_file_url(@pd_file)
    assert_response :success
  end

  test "should update pd_file" do
    patch pd_file_url(@pd_file), params: { pd_file: { file_name: @pd_file.file_name } }
    assert_redirected_to pd_file_url(@pd_file)
  end

  test "should destroy pd_file" do
    assert_difference('PdFile.count', -1) do
      delete pd_file_url(@pd_file)
    end

    assert_redirected_to pd_files_url
  end
end
