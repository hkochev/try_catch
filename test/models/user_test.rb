require 'test_helper'

class UserTest < ActiveSupport::TestCase
  let(:user) { User.create! email: 'testnew@test.com', password: 'password' }

  it 'raises exception on create witout email' do
    -> { User.create! }.must_raise
  end

  it 'creates instance of User' do
    user.must_be_instance_of User
  end

  it 'has a default role' do
    user.role.must_equal 'guest'
  end

  it 'has many lists' do
    user.must_respond_to :task_lists
  end
end
