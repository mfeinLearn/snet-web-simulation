class ServicesController < ApplicationController

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
     #byebug
  #  @service = Service.new(service_params)#find_or_create_by
    @service = Service.find_or_create_by(service_params)#find_or_create_by
    #byebug
    @ai = Ai.find_by(id: params[:ai_id])
    #byebug
    #@transaction = @service.transactions.build - wrong
    if @service.save
      #@transaction = @service.transactions.build(ai_id: params[:ai_id])
      @transaction = Transaction.new
      #byebug
      #@transaction.save
      render "transactions/new"
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

  private

  def service_params
    params.require(:service).permit(:name, :description ,:price, :ai_id)
  end

end
