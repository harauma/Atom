class AppliController < ApplicationController
  def new
  end

  def check
    @name = params[:name]
    @place = params[:place]
    @prefecture = params[:prefecture]
    @s_time = params[:s_time]
    @e_time = params[:e_time]
    @d_time = params[:d_time]
  end

end
