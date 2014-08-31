require 'test_helper'

class AticelsControllerTest < ActionController::TestCase
  setup do
    @aticel = aticels(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:aticels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create aticel" do
    assert_difference('Aticel.count') do
      post :create, aticel: { content: @aticel.content, name: @aticel.name, properties: @aticel.properties, published_on: @aticel.published_on, tags: @aticel.tags }
    end

    assert_redirected_to aticel_path(assigns(:aticel))
  end

  test "should show aticel" do
    get :show, id: @aticel
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @aticel
    assert_response :success
  end

  test "should update aticel" do
    patch :update, id: @aticel, aticel: { content: @aticel.content, name: @aticel.name, properties: @aticel.properties, published_on: @aticel.published_on, tags: @aticel.tags }
    assert_redirected_to aticel_path(assigns(:aticel))
  end

  test "should destroy aticel" do
    assert_difference('Aticel.count', -1) do
      delete :destroy, id: @aticel
    end

    assert_redirected_to aticels_path
  end
end
