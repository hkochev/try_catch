require 'test_helper'

class AbilityTest < ActiveSupport::TestCase
  let(:user) { User.create! email: 'user@test.com', password: 'testpass', role: :user }
  let(:user_task_list) { TaskList.create! title: 'test', user: user  }
  let(:user_task) { Task.create! title: 'test', task_list: user_task_list }
  let(:guest_task_list) { TaskList.create! title: 'test', user: User.create!( email: 'guest@test.com', password: 'testpass')  }

  subject { Ability.new user }

  it 'could update his task' do
    subject.can?(:update, user_task).must_equal true
  end

  it 'could not update new task' do
    subject.cannot?(:update, Task.create!(title: 'test', task_list: guest_task_list)).must_equal true
  end
end
