1. Took out Turbolinks form the following:
   - gem 'turbolinks'
   - Remove the //= require turbolinks from your app/assets/javascripts/application.js .
   - Remove the two "data-turbolinks-track" => "reload" hash key/value pairs from your app/views/layouts/application.html.erb
2. add serializer to models (service, transaction, user, ai)
rails g serializer service
rails g serializer transaction
rails g serializer user
rails g serializer ai

3. add all of the attributes and associations (I left out the accepts_nested_attributes_for :service from Transaction need to solve!!!!!!!)

4. add to_json in the controller actions
EX:
# posts_controller
# ...
  def show
    @post = Post.find(params[:id])
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @post.to_json(only: [:title, :description, :id],
                              include: [author: { only: [:name]}]) }
    end
  end

  def show
    @post = Post.find(params[:id])
    respond_to do |format|
      format.html { render :show }
      format.json {render json: @post.to_json}
    end
  end


<!--  -->
<!--  -->
Questions:

What is your plan to render an index page via JavaScript & JSON?

What is your plan to render a show page via JavaScript & JSON?
