ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

DatabaseCleaner.strategy = :transaction

class ActionDispatch::IntegrationTest
   def http_login(email, password, headers = {})
     User.find_or_create_by(email: email) do |user|
       user.password = password
       user.role = :admin
    end
     headers['HTTP_AUTHORIZATION'] ||= ActionController::HttpAuthentication::Basic.encode_credentials(email, password)

     headers
   end
end

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  before :each do
    DatabaseCleaner.start
  end

  after :each do
    DatabaseCleaner.clean
  end
end
