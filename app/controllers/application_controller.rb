class ApplicationController < ActionController::Base
    before_action :set_current_user
    protect_from_forgery
    def set_current_user
      @current_user = Student.find_by(id: session[:id])
    end
end
