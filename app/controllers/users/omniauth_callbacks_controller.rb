class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  def github
    @username = oauth_params["info"]["nickname"]
    @email = oauth_params["info"]["email"]

    fullname = oauth_params["extra"]["raw_info"]["name"]
    @firstname = fullname.split.first
    @lastname = fullname.split.last
    
    sign_in find_or_create_user
    redirect_to :root
  end

  def facebook
    
    redirect_to :root
  end

  # You should also create an action method in this controller like this:
  # def twitter
  # end

  # More info at:
  # https://github.com/plataformatec/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end

    def oauth_params
      @oauth_params ||= request.env["omniauth.auth"]
    end

    def provider
      oauth_params["provider"]
    end

    def uid
      oauth_params["uid"]
    end

    def find_or_create_user
      auth = User::Auth.find_by(provider: provider, uid: uid)
      return auth.user if auth

      user = User.create(
        username: @username,
        password: Devise.friendly_token.first(8),
        email: @email,
        firstname: @firstname,
        lastname: @lastname
      )
      user.save!
      user.auths.create!(provider: provider, uid: uid, raw: oauth_params, user: user)
      user
    end
end
