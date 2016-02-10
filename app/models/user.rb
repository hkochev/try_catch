class User < ApplicationRecord
  has_secure_password validations: false
  enum role: [:guest, :user, :admin]
  # validations
  validates :email, presence: true, email: true, uniqueness: true, on: :create
  validates :password, presence: true, on: :create
  # relations
  has_many :task_lists
end
