class TaskList < ApplicationRecord
  # associations
  belongs_to :user
  has_many :tasks

  # validations
  validates :user_id, :title, presence: true
end
