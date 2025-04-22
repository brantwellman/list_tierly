class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Temporary way to set current_user until authentication is added
  def current_user
    @current_user ||= User.first || raise("No user found")
  end
end
