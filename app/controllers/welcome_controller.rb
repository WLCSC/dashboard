class WelcomeController < ApplicationController
  def index
      @services = Service.where(true)
  end
end
