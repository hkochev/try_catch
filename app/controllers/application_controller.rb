class ApplicationController < ActionController::API
  include ActionController::Serialization
  include ActionController::HttpAuthentication::Basic::ControllerMethods
  include CanCan::ControllerAdditions
  before_action :authenticate

  load_and_authorize_resource
  rescue_from(CanCan::AccessDenied) { render status: :forbidden }

  protected
  attr_reader :current_user

  def respond_with_json(models, options = {})
    if models.respond_to?(:errors) && !models.errors.empty?
      render json: models.errors, status: :unprocessable_entity
    else
      render options.merge!(json: models)
    end
  end

  private

  def authenticate
    authenticate_or_request_with_http_basic do |user_email, password|
      @current_user = User.find_by(email: user_email).try(:authenticate, password)
    end
  end
end
