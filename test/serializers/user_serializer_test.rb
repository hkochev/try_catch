require 'test_helper'

class UserSerializerTest < ActiveSupport::TestCase
  let(:user)       { User.create! name: 'user1', email: 'test@test.com', password: 'testpass' }
  let(:serializer) { UserSerializer.new user }
  subject          { serializer.as_json['user'] }

  before { 3.times { |it| user.task_lists << TaskList.new(title: "title #{it}") } }

  it 'embeds user task lists' do
    subject[:task_lists].first.must_include :id, :title
  end

  it 'expose id, email' do
    subject.must_include :id, :email
  end

  it 'do not expose password' do
    subject.wont_include :password
  end
end
