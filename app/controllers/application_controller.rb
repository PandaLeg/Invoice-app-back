class ApplicationController < ActionController::Base
=begin
  protect_from_forgery with: :null_session
=end
  skip_before_action :verify_authenticity_token
end
