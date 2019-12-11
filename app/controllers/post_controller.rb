class PostController < ApplicationController
  def index
    if @current_user
      @prov_student = []
      @prov_appli = AppliSubmit.joins(:appli).joins(:teacher).where(teacher_id:@current_user.id, admit_flg:0, watch_flg:0, delete_flg:0).select("teachers.*,applis.*,appli_submits.*")
      @prov_appli.each do |appli|
        @prov_student << Student.find_by(id: appli.student_id)
      end
      @prod_student = []
      @prod_appli = AppliSubmit.joins(:appli).joins(:teacher).where(teacher_id: @current_user.id,admit_flg: 2, watch_flg: 0, delete_flg:0).select("teachers.*,applis.*,appli_submits.*")
      @prod_appli.each do |appli|
        @prod_student << Student.find_by(id: appli.student_id)
      end
    end
  end

  def approval
    id = params[:id].to_i
    flg = params[:flg].to_i
    commit_flg = params[:commit]
    reply = params[:reply]
    appli = AppliSubmit.find_by(id:id)
    if flg == 0
      case commit_flg
      when "承認" then
        appli.admit_flg = 1
        appli.watch_flg = 0
        appli.reply = reply
        appli.save
      when "非承認" then
        appli.admit_flg = 0
        appli.watch_flg = 1
        appli.reply = reply
        appli.save
      end
      redirect_to('/post/index')
    else
      case commit_flg
      when "承認" then
        appli.admit_flg = 3
        appli.watch_flg = 0
        appli.reply = reply
        appli.save
      when "非承認" then
        appli.admit_flg = 2
        appli.watch_flg = 1
        appli.reply = reply
        appli.save
      end
      redirect_to('/post/index')
    end
  end

end
