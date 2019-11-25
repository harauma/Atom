class SUserController < ApplicationController
  def top
  end
  
  def new

  end

  def change

  end

  def change_form
    
  end

  def submit
    @pass = params[:pass]
    @conf = params[:pass_conf]
    @name = params[:name]
    @id = params[:id]
    @user_id = "s"+@id.to_s
    @class = params[:class]
    @num = params[:num]
    if @pass == @conf
      @student = Student.new(id:@id,student_name:@name,class_name:@class,class_num:@num)
      @account = StudentAccount.new(id:@user_id,password:@pass,student_id:@id)
      begin
      @student.save
      @account.save
      redirect_to('/login')
      rescue => exception
      redirect_to('/s_user/new')
      end
    else
      redirect_to('/s_user/new')
    end
  end
end
