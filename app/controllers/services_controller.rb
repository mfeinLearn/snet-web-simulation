class ServicesController < ApplicationController
  def index
    #binding.pry
    if params[:ai_id]
      @ai = Ai.find_by(id: params[:ai_id])
      if @ai
        #binding.pry
        @services = @ai.services
      else
        redirect_to ais_path, alert:"AI not found"
      end
    else
      @services = Service.all
    end
  end

  def show
    if params[:ai_id]
      @ai = Ai.find_by(id: params[:ai_id])
      @services = @ai.services.find_by(id: params[:id])
      if @service.nil?
        redirect_to ai_services_path(@ai), alert:"Service not found"
      end
    else
      @service = Service.find(params[:id])
    end
  end

  def new
    @service = Service.new
  end

  def create
    @service = Service.new(service_params)

    if @service.save
      redirect_to @service
    else
      render :new
    end
  end

  def edit
    @service = Service.find(params[:id])
  end

  def update
    @service = Service.find(params[:id])

    @service.update(service_params)

    if @service.save
      redirect_to @service
    else
      render :edit
    end
  end

  def destroy
    @service = Service.find(params[:id])
    @service.destroy
    flash[:notice] = "Service deleted."
    redirect_to services_path
  end


  def service_params
    params.require(:service).permit(:name, :description ,:price)
  end

end
