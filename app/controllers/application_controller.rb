class ApplicationController < ActionController::Base
    protect_from_forgery

    #before_filter :check_for_user

    private
    def admin?
        session[:adminkey] == "password"
    end

    def check_for_admin
        redirect_to root_path unless admin?
    end

end
