require 'test_helper'

class PropertyPicturesControllerTest < ActionController::TestCase
  setup do
    @property_picture = property_pictures(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:property_pictures)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create property_picture" do
    assert_difference('PropertyPicture.count') do
      post :create, property_picture: { avatar_url: @property_picture.avatar_url, name: @property_picture.name }
    end

    assert_redirected_to property_picture_path(assigns(:property_picture))
  end

  test "should show property_picture" do
    get :show, id: @property_picture
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @property_picture
    assert_response :success
  end

  test "should update property_picture" do
    patch :update, id: @property_picture, property_picture: { avatar_url: @property_picture.avatar_url, name: @property_picture.name }
    assert_redirected_to property_picture_path(assigns(:property_picture))
  end

  test "should destroy property_picture" do
    assert_difference('PropertyPicture.count', -1) do
      delete :destroy, id: @property_picture
    end

    assert_redirected_to property_pictures_path
  end
end
