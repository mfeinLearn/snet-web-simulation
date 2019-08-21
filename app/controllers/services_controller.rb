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
      # redirect_to service_path(@service)
      # this will take advantage of the seralizer that
      # we have defined for my service.
      # once I generate json of the service that is going to send
      # me back to my callback inside .done (go back to service.js)

      # a side note: when we click the create
      # service button we see the new service that
      # we added and got back from the server in json
      # format... now I want to take this
      # json that gets returned to me from the server
      # and append it to the dom in order to do that
      # go to the application layout. You will see that I
      # have wrapped my yield block in
      # this div with an id of app-container
      #this is going to be the div that I
      # clear out and repaint the dom with anytime I
      # want to display something new using ajax
      render json: @service
     else
       render :new
    end
  end

  def next
    # it is going to call that instance method
    # grab the next post set it equal to an instance varible
    # then render json.
    set_service
    @next_service = @service.next
    render json: @next_service
  end


  def index
    @services = Service.all.order_by_price.search(params[:search])
    respond_to do |f|
      f.html
      f.json {render json: @services}
    end
  end

  def show
    @service = Service.find_by(id: params[:id])
    respond_to do |f|
      f.html
      f.json {render json: @service}
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
