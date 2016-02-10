require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  let(:password) { 'testpass' }
  let(:email)    { 'controlertest@test.com' }
  let(:user)      { users(:one) }

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should show user" do
    get user_url(user)
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post users_url, params: { user: { email: email, password: password } }
    end

    assert_response 201
  end

  test "should update user" do
    patch user_url(user), params: { user: { name: 'testname' } }
    assert_response 200
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete user_url(user)
    end

    assert_response 204
  end
end
