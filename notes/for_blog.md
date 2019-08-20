Index action:

1. add the respond_to to be able to access the services through html or json

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
    respond_to do |f|
      f.html
      f.json {render json: @services}
    end
  end
end

2. active_model_serializers gem
3. I want to hijack the click event when the user clicks on 'All Services'
  go to ais.js (which we create and add an event listener)
  ---------------------------------
  const bindClickHandlers = () => {
    $(document).on('click','#all_services', (e) =>{
      e.preventDefault()
      console.log('hello')
    })
  }
  ---------------------------------
4. When ever the button is clicked we want to make
a call to our backend api / back end server (we do this with the fetch api)

5. If we go to  application.html.erb we see:
<%= render 'layouts/navbar' %>
<div id="app-container">
  <%= yield %>
</div>

This is going to be the div that we are going to use
to redraw my dom any time I want something to be handled with jquery
No matter what(refreshing the page and it is being handled by rails
  because I put the yeald keyword inside my app-container it is
  also going to work weather I am painting the dom via rails or painting
  the dom via jquery) (so any time I want to paint the dom
    I will just grab the app-container and then just inject html into
    that app-container and it will replace what ever being yealded at
    that point )
