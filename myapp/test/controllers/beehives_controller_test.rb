require 'test_helper'

class BeehivesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @beehive = beehives(:one)
  end

  test "should get index" do
    get beehives_url
    assert_response :success
  end

  test "should get new" do
    get new_beehive_url
    assert_response :success
  end

  test "should create beehive" do
    assert_difference('Beehive.count') do
      post beehives_url, params: { beehive: { name: @beehive.name } }
    end

    assert_redirected_to beehive_url(Beehive.last)
  end

  test "should show beehive" do
    get beehive_url(@beehive)
    assert_response :success
  end

  test "should get edit" do
    get edit_beehive_url(@beehive)
    assert_response :success
  end

  test "should update beehive" do
    patch beehive_url(@beehive), params: { beehive: { name: @beehive.name } }
    assert_redirected_to beehive_url(@beehive)
  end

  test "should destroy beehive" do
    assert_difference('Beehive.count', -1) do
      delete beehive_url(@beehive)
    end

    assert_redirected_to beehives_url
  end
end
