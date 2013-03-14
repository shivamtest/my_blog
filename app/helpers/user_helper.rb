helpers do
  def current_user
    if session[:token] && User.find_by_token(session[:token])
      @current_user ||= User.find_by_token(session[:token])
    end
  end

  def logged_in?
    !current_user.nil?
  end
end
