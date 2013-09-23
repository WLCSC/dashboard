class SessionController < ApplicationController
  def new
  end

  def create
      if params[:password].empty?
        session[:adminkey] = nil
      else
          session[:adminkey] = params[:password]
      end
      redirect_to root_path
  end
end
