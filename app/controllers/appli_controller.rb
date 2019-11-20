class AppliController < ApplicationController
  def new
    @current_date = Time.current
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

  def appli_params
    params.require(:appli).permit(:company_name,:place,:cantent,:start,:end,:withdrawal_day,:withdrawal,:admit_flg,:watch_flg)
  end

end
