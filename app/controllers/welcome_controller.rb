class WelcomeController < ApplicationController
  def index
      @services = Service.where(:server_id => nil)
  end
end
