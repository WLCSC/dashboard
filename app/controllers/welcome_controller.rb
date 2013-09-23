class WelcomeController < ApplicationController
  def index
      if params[:tech] || admin?
          @services = Service
          @top_services = Service.where(:server_id => nil)
      else
          @services = Service.where(:technical => false)
          @top_services = @services.where(:server_id => Service.where(:technical => true).ids + [nil])
      end

      @external = request.remote_ip.match(/^10\.10\./) ? true : false
  end
end
