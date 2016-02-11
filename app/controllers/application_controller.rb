require "application_responder"

class ApplicationController < ActionController::API
  self.responder = ApplicationResponder
  respond_to :json

  include ActionController::Serialization
  include ActionController::HttpAuthentication::Basic::ControllerMethods

  before_action :authenticate

  private
  def current_user=(current_user = nil)
    @current_user = current_user
  end

  def authenticate
    authenticate_or_request_with_http_basic do |user_email, password|
      current_user = User.find_by(email: user_email).try(:authenticate, password)
    end
  end
end
