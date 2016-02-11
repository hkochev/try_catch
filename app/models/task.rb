class Task < ApplicationRecord
  # associations
  belongs_to :task_list
  # validations
  validates :title, :task_list_id, presence: true
end
