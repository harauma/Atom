class TUserController < ApplicationController
  def top
  end

  def new

  end

  def create
    @pass = params[:pass]
    @conf = params[:pass_conf]
    @name = params[:name]
    @id = params[:id]
    @user_id = "t"+@id.to_s
    @course = params[:class_code]
    if @pass == @conf
      @student = Teacher.new(id:@id,name:@name,course_id:@course)
      @account = TeacherAccount.new(id:@user_id,password:@pass,teacher_id:@id)
      begin
      @student.save
      @account.save
      redirect_to('/login')
      rescue => exception
      redirect_to('/t_user/new')
      end
    else
      redirect_to('/t_user/new')
    end
  end

  def appli
    if @current_user
      @prov_student = []
      @prov_appli = AppliSubmit.joins(:appli).joins(:teacher).where(teacher_id: @current_user.id, admit_flg:3, delete_flg:0).select("teachers.*,applis.*,appli_submits.*")
      @prov_appli.each do |appli|
        @prov_student << Student.find_by(id: appli.student_id)
      end
      @prod_appli = []
      # @prod_appli = AppliSubmit.joins(:appli).joins(:teacher).merge(Appli.where(student_id: @current_user.id)).where(admit_flg:2, watch_flg:1, delete_flg:0).select("teachers.*,applis.*,appli_submits.*")
      # @prod_appli.each do |appli|
      #   @prod_student << Student.find_by(id: appli.student_id)
      # end
    end
  end

end
