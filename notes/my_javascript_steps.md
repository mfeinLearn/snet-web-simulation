1. Took out Turbolinks form the following:
   - gem 'turbolinks'
   - Remove the //= require turbolinks from your app/assets/javascripts/application.js .
   - Remove the two "data-turbolinks-track" => "reload" hash key/value pairs from your app/views/layouts/application.html.erb
2. add serializer to models (service, transaction, user, ai)

rails g serializer service
rails g serializer transaction
rails g serializer user
rails g serializer ai
