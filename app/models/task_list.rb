class TaskList < ApplicationRecord
  # associations
  belongs_to :user
  has_many :tasks

  # validations
  validates :title, presence: true
end
