# encoding: utf-8
class Users::RegistrationsController < Devise::RegistrationsController

  def create
    # if Settings.user.skip_captcha || simple_captcha_valid?
    #   super
    # else
    #   build_resource(sign_up_params)
    #   clean_up_passwords(resource)
    #   flash.now[:alert] = "验证码不匹配，请重新输入"
    #   flash.delete :captcha_error
    #   render :new
    # end

    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Successfully created user."
      if params[:user][:avatar].blank?
        redirect_to @user
      else
        render :action => 'crop'
      end
    else
      render :action => 'new'
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:notice] = "Successfully updated user."
      if params[:user][:avatar].blank?
        redirect_to @user
      else
        render :action => 'crop'
      end
    else
      render :action => 'edit'
    end
  end

  def is_uid_exist
    user = User.new(uid: params[:uid])

    respond_to do |format|
      if !user.valid? && user.errors[:uid].present?
        format.json { render json: { message: "用户名 #{user.uid} #{user.errors[:uid].first}" }, status: 403}
      else
        format.json{ render json: { message: "用户名 #{user.uid} 可以使用" } }
      end
    end
  end

end
