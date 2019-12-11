class ApplicationController < ActionController::Base
    before_action :set_current_user
    def set_current_user
      if session[:login_id] && session[:login_id][0] == "s"
        @current_user = Student.find_by(id: session[:id])
        @flg = session[:login_id][0]
      elsif session[:login_id] && session[:login_id][0] == "t"
        @current_user = Teacher.find_by(id: session[:id])
        @flg = session[:login_id][0]
      end
    end

end
