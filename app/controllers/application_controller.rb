class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_user

  def set_user
    if current_user
      gon.push(
        current_user: {
          id: current_user.id,
          fullname: current_user.fullname,
          firstname: current_user.firstname,
          lastname: current_user.lastname
        }
      )
    end

    @new_user = User.new
  end
end
