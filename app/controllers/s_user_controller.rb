class SUserController < ApplicationController
  def new

  end

  def change

  end

  def change_form

  end


  def applis
    if @current_user
      @student = []
      @appli = AppliSubmit.joins(:appli).joins(:teacher).merge(Appli.where(student_id: @current_user.id)).where(admit_flg:0, watch_flg:0, delete_flg:0).select("teachers.*,applis.*,appli_submits.*")
      @appli.each do |appli|
        @student << Student.find_by(id: appli.student_id)
      end
      @prov_student = []
      @prov_appli = AppliSubmit.joins(:appli).joins(:teacher).merge(Appli.where(student_id: @current_user.id)).where(admit_flg:0, watch_flg:1, delete_flg:0).select("teachers.*,applis.*,appli_submits.*")
      @prov_appli.each do |appli|
        @prov_student << Student.find_by(id: appli.student_id)
      end
      @prod_student = []
      @prod_appli = AppliSubmit.joins(:appli).joins(:teacher).merge(Appli.where(student_id: @current_user.id)).where(admit_flg:1, delete_flg:0).select("teachers.*,applis.*,appli_submits.*")
      @prod_appli.each do |appli|
        @prod_student << Student.find_by(id: appli.student_id)
      end
    end
  end

  def post
    id = params[:id]
    comment = params[:comment]
    appli_submit = AppliSubmit.find_by(id:id)
    appli = Appli.find_by(id: appli_submit.appli_id)
    appli.update(comment:comment)
    appli_submit.update(admit_flg:2, watch_flg:0)
    redirect_to('/s_user/applis')
  end

  def delete
    id = params[:id]
    appli = AppliSubmit.find_by(id:id)
    appli.delete_flg = 1
    begin
      appli.save
      redirect_to('/s_user/applis')
    rescue => exception
      redirect_to('/s_user/applis')
    end

  end

  def submit
    @pass = params[:pass]
    @conf = params[:pass_conf]
    @name = params[:name]
    @id = params[:id]
    @user_id = "s"+@id.to_s
    @class = params[:class]
    @course = @class[0]
    @num = params[:num]
    if @pass == @conf
      @student = Student.new(id:@id,student_name:@name,class_name:@class,class_num:@num,course_id:@course)
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

  def honban
    if @current_user
      @student = []
      @appli = AppliSubmit.joins(:appli).joins(:teacher).merge(Appli.where(student_id: @current_user.id)).where(admit_flg:2, watch_flg:0, delete_flg:0).select("teachers.*,applis.*,appli_submits.*")
      @appli.each do |appli|
        @student << Student.find_by(id: appli.student_id)
      end
      @prov_student = []
      @prov_appli = AppliSubmit.joins(:appli).joins(:teacher).merge(Appli.where(student_id: @current_user.id)).where(admit_flg:2, watch_flg:1, delete_flg:0).select("teachers.*,applis.*,appli_submits.*")
      @prov_appli.each do |appli|
        @prov_student << Student.find_by(id: appli.student_id)
      end
      @prod_student = []
      @prod_appli = AppliSubmit.joins(:appli).joins(:teacher).merge(Appli.where(student_id: @current_user.id)).where(admit_flg:3, delete_flg:0).select("teachers.*,applis.*,appli_submits.*")
      @prod_appli.each do |appli|
        @prod_student << Student.find_by(id: appli.student_id)
      end
    end
  end

end
