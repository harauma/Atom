class AppliController < ApplicationController
  protect_from_forgery :except => [:submit]
  def new
    @current_date = Time.current
  end

  def index
    @appli = Appli.where(student_id:@current_user.id,delete_flg:0)
  end

  def edit
    @appli = Appli.find_by(id: params[:id])
  end

  def update
    @appli = Appli.find_by(id: params[:id])
    @appli.update(appli_params)
    if session[:re_flg] == 0
      session[:re_flg] = nil
      redirect_to('/s_user/applis')
    else
      redirect_to('/appli/index')
    end
  end

  def check
    @name = params[:name]
    @place = params[:place]
    @prefecture = params[:prefecture]
    @s_date = params[:s_date]
    @e_date = params[:e_date]
    @d_date = params[:d_date]
    @s_time = params[:s_time]
    @e_time = params[:e_time]
    @d_time = params[:d_time]
    @appli = Appli.new(appli_params)

  end

  def submit
    @appli = Appli.new(appli_params)
    if @appli.save
      redirect_to('/')
    else
      render('new')
    end
  end

  def show
    @appli = Appli.find_by(id: params[:id])
    @student = Student.find_by(id: @appli.student_id)
    @teachers = Teacher.all
  end

  def post
    @post = AppliSubmit.new(post_params)
    begin
      @post.save
      redirect_to('/appli/index')
    rescue => exception
      redirect_to('/appli/show')
    end
  end

  def repost
    @post = AppliSubmit.find_by(id: params[:id])
    puts params[:id]
    @post.update(watch_flg:0)
    redirect_to('/s_user/applis')
  end

  def delete
    @appli = Appli.find_by(id: params[:id])
    @appli.delete_flg = 1
    @appli.save
    redirect_to('/appli/index')
  end

  def appli_params
    params.require(:appli).permit(:id,:company_name,:place,:content,:start,:end,:withdrawal_day,:withdrawal,:student_id,:delete_flg)
  end

  def post_params
    params.require(:appli_submit).permit(:id,:reply,:appli_id,:admit_flg,:watch_flg,:teacher_id,:delete_flg)
  end

end
