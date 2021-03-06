class Admin::ApplicationController < ActionController::Base
  protect_from_forgery
  layout 'admin'
    
  before_filter :authenticate
  protected
    def authenticate
      authenticate_or_request_with_http_basic do |username, password|
      username == "admin" && password == "test"
    end
  end
end
