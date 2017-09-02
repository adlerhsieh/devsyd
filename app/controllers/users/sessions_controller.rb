class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
    case params[:s]
    when "1"
      @message = "請先登入"
    end
    if not_authenticated?
      @message = "帳號或密碼錯誤"
    end
    session[:redirect] = params[:r]
    super
  end

  # POST /resource/sign_in
  def create
    # super
    self.resource = warden.authenticate!(auth_options)
    sign_in(resource_name, resource)

    if session[:redirect]
      redirect_to session.delete(:redirect)
    else
      after_sign_in_path_for(resource)
    end
  end

  # DELETE /resource/sign_out
  def destroy
    # super
    sign_out current_user
    redirect_to request.referer
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  end

  def not_authenticated?
    params[:action] == "create" && params[:user][:email] && params[:user][:password]
  end
end
