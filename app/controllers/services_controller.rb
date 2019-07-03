class ServicesController < ApplicationController


# find_by_id wont error out and is just nil if it cant find it
  def new
    @ai = Ai.find_by_id(params[:ai_id])
    #raise @ai.inspect
    # check if its nested & it's a proper id
    if params[:ai_id] && ai = Ai.find_by_id(params[:ai_id])
    # nested route
      @service = ai.services.build
    else
      #unnested
      @service = Service.new
    end
  end
# user -< ai -< transaction >- service
  def create
    @service = Service.find_or_create_by(service_params)#find_or_create_by
    @ai = Ai.find_by(id: params[:ai_id])
    if @service.save
      redirect_to service_path(@service)
    else
      render :new
    end
  end


  def index
    #binding.pry
    if params[:ai_id]
      @ai = Ai.find_by(id: params[:ai_id])
      #@ai = Ai.find_by(id: 12)
      if @ai
        #binding.pry
        #byebug
        @services = @ai.services.order_by_price.search(params[:search])
      else
        redirect_to ais_path, alert:"AI not found"
      end
    else
      @services = Service.all.order_by_price.search(params[:search])
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
      set_service
    end
  end


  def edit
    set_service
  end

  def update
    set_service
    @service.update(service_params)
    if @service.save
      redirect_to @service
    else
      render :edit
    end
  end

  def destroy
    set_service
    @service.destroy
    flash[:notice] = "Service deleted."
    redirect_to services_path
  end

  private

  def set_service
    @service = Service.find_by(id: params[:id])
    if !@service
      redirect_to services_path
    end
  end

  def service_params
    params.require(:service).permit(:name, :description ,:price, :ai_id)
  end

end
