require 'test_helper'

class UserSerializerTest < ActiveSupport::TestCase
  let(:task_lists) { 3.times.inject([]) { |res| res << TaskList.new(title: "title #{res.size}") } }
  let(:serializer) { UserSerializer.new User.create!(name: 'user1', email: 'test@test.com', password: 'testpass', task_lists: task_lists) }
  let(:json)       { serializer.as_json['user'] }

  it 'embeds user task lists' do
    json[:task_lists].first.must_include :id, :title
  end

  it 'expose id, email' do
    json.must_include :id, :email
  end

  it 'do not expose password' do
    json.wont_include :password
  end
end
