class ApplicationController < ActionController::Base
  def current_user=(user)
    cookies.signed[:user_id] = user.id

    redirect_to root_path
  end

  def require_no_current_user
    return unless current_user?

    redirect_to root_path
  end

  def require_current_user
    return if current_user?

    redirect_to root_path
  end

  helper_method def current_user
    @current_user ||= User.find_by(id: cookies.signed[:user_id])
  end

  helper_method def current_user?
    current_user.present?
  end
end
