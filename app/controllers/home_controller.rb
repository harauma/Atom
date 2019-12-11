class HomeController < ApplicationController
  skip_before_action :set_current_user, only: [:login, :logout, :login_form]
  protect_from_forgery :except => [:login]
  def top

  end

  def login_form

  end

  def login
    @id = params[:id]
    @pass = params[:pass]
    if @id[0] == "s"
      @account = StudentAccount.find_by(id:@id,password:@pass)
      if @account
        session[:id] = @account.student_id
        session[:login_id] = @account.id
        redirect_to('/')
      else
        redirect_to('/login')
      end
    else
      @account = TeacherAccount.find_by(id:@id,password:@pass)
      if @account
        session[:id] = @account.teacher_id
        session[:login_id] = @account.id
        redirect_to('/')
      else
        redirect_to('/login')
      end
    end

  end

  def logout
    session[:id] = nil
    session[:login_id] = nil
    session[:re_flg] = nil
    redirect_to('/login')
  end
end
