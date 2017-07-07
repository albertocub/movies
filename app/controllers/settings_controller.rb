class SettingsController < ApplicationController
before_action :authenticate_user!   
layout "admin"
  def index
  	@setting = current_user.setting  
    @payment = current_user.payments.all.order("created_at DESC").limit(1) 
    flash[:success] = t('setting.welcome_user')
  end
  def show
  	@setting = Setting.find(params[:id])  
  end 
  def new
    @setting = current_user.build_setting  
  end
  def create
    @setting = current_user.build_setting(setting_params)
    if @setting.save
      flash[:success] = t('setting.create_success')
      redirect_to settings_path
    else
      flash[:success] = t('setting.createnot')
      render 'new'
    end
  end
  def edit
    @setting = Setting.find(params[:id])
  end
  def update
    @setting = Setting.find(params[:id])
    if @setting.update_attributes(setting_params)
      flash[:success] = t('setting.update_success')
      redirect_to settings_path
    else
      flash[:success] = t('setting.updatenot')
      render :edit
    end
  end
  def destroy
    @setting = Setting.find(params[:id])
    @setting.destroy
    redirect_to settings_path
  end
  private
  def setting_params
    params.require(:setting).permit(:country, :language)
  end  
end