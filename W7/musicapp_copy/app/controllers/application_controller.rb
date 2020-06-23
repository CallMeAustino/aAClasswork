class ApplicationController < ActionController::Base
# skip_before_action :verify_authenticity_token
helper_method :current_user, :logged_in?

    def current_user
        @current_user ||= User.find_by(session_token: session[:session_token])
    end

    def ensure_logged_in
    end

    def login!
        session[:session_token] = current_user.reset_session_token!
    end

    def logout!
        session[:session_token] = nil
        current_user.reset_session_token!
        current_user = nil
    end

    def logged_in?
        session[:session_token] == current_user.session_token
    end

end
