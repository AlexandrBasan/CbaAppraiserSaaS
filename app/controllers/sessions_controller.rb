class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      #redirect_back_or user
      redirect_back_or root_path
    else
      flash.now[:danger] = I18n.t 'flash.invalid_email/password_combination'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end

  # variable for OAuth initialize
  @@invitation_token_oauth = nil

  #OAuth
  def create_oauth
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    if @@invitation_token_oauth.nil? || @@invitation_token_oauth.blank?
    else
      require 'securerandom'
      @pass = SecureRandom.hex(12)
      user.password = @pass
      user.password_confirmation = @pass
      user.invitation_token = @@invitation_token_oauth
      user.save
      @@invitation_token_oauth = nil
    end
      #sign_in user
      #redirect_back_or root_path
    if User.check_oauth_errors == true
      sign_in user
      redirect_back_or root_path
    else
      fail_oauth
    end
  end

  def create_oauth_with_token
    if params[:invitation_token].nil? || params[:invitation_token].blank?
      @@invitation_token_oauth = nil
    else
      @@invitation_token_oauth = params[:invitation_token]
    end
    redirect_to "/auth/" + params[:provider]
  end

  def destroy_oauth
    session[:user_id] = nil
    redirect_to root_url
  end

  def fail_oauth
    respond_to do |format|
      format.html { flash[:warning] = (t 'flash.social_network_login_error')
      redirect_to signup_path }
      format.json { head :no_content }
      format.xml { head :no_content }
    end
  end

end