class ApplicationController < ActionController::Base


    helper_method :current_user, :logged_in?

def current_user
    @currrent_user ||= User.find(session[:user_id]) if session[:user_id]
end

def logged_in?
    !! current_user
end

def require_user
    if !logged_in?  
        flash[:danger]="You have not logged in."
        redirect_to root_path
    end
end


end