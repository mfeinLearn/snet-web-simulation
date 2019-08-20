Must render at least one index page (index resource - 'list of things') via JavaScript and an Active Model Serialization JSON Backend.
----------
Render a click button that when clicked... renders all of my services to the DOM without a page refresh
========================


Must render at least one show page (show resource - 'one specific thing') via JavaScript and an Active Model Serialization JSON Backend.
-----
In the show page, I can have a button
for "Next" to render the next service via jquery
======================

Your Rails application must dynamically render on the page at least one serialized 'has_many' relationship through JSON using JavaScript.
-----
When I render the show pages, I can make sure that transactions related to each service also get rendered from the json data that gets returned form active model serializers
======================


Must use your Rails application to render a form for creating a resource that is submitted dynamically and displayed through JavaScript and JSON without a page refresh.
-----
In my form to create a service on the show page, I can use jquery to make a post request to my backend api endpoint and use the response from that post request to append the dom with that newly created service.
======================

Must translate JSON responses from your Rails app into JavaScript Model Objects using either ES6 class or constructor syntax. The Model Objects must have at least one method on the prototype. (Formatters work really well for this.)
-----
In the rendering of my index and show pages as well as creating a new service, I can create a JS object model for each json object that gets returned from my API and use a prototype method to manipulate that object.
=========================
