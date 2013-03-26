class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper

  # Force signout
  def handle_unverified_request
    log_out
    super
  end
end
