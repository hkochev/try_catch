require 'test_helper'

class TaskListSerializerTest < ActiveSupport::TestCase
  let(:user)       { User.create! name: 'user1', email: 'test@test.com', password: 'testpass' }
  let(:serializer) { TaskListSerializer.new TaskList.create!(title: 'list1', user: user) }
  let(:json)       { serializer.as_json['task_list'] }

  it 'expose id, name, email' do
    json.must_include :id, :title
  end

  it 'do not expose user' do
    json.wont_include :user
  end
end
