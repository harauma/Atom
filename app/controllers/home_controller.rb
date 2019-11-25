class HomeController < ApplicationController
  skip_before_action :set_current_user, only: [:login, :logout]
  def top

  end

  def login_form

  end

  def login
    @id = params[:id]
    @pass = params[:pass]
    @account = StudentAccount.find_by(id:@id,password:@pass)
    if @account
      session[:id] = @account.student_id
      redirect_to('/')
    else
      redirect_to('/login')
    end
  end

  def logout
    session[:id] = nil
    redirect_to('/login')
  end
end
