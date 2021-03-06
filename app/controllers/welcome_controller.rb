class WelcomeController < ApplicationController
  def index
      if params[:tech] || admin?
          @services = Service.all
          @top_services = Service.where(:server_id => nil)
      else
          @services = Service.where(:technical => false)
          @top_services = @services.where(:server_id => Service.where(:technical => true).ids + [nil])
      end

      @external = request.remote_ip.match(/^10\.10\./) ? false : true

      respond_to do |format|
          format.html {}
          format.json {}
      end
  end

  def published
    if params[:tech] || admin?
          @services = Service.where(:publish => true)
          @top_services = Service.where(:server_id => nil, :publish => true)
      else
          @services = Service.where(:technical => false, :publish => true)
          @top_services = @services.where(publish => true, :server_id => Service.where(:technical => true).ids + [nil])
      end

      @external = request.remote_ip.match(/^10\.10\./) ? false : true

    respond_to do |format|
          format.html {render :index}
          format.json {render :index}
      end

  end
end
