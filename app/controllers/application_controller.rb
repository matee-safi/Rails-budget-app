class ApplicationController < ActionController::Base
  rescue_from CanCan::AccessDenied do |_exception|
    flash[:error] = 'Access denied.'
    redirect_to root_url
  end
end
