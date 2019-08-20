$(() => { // document ready
  bindClickHandlers()
})

const bindClickHandlers = () => { // <- 15:27
  $(document).on('click','#all_services', (e) =>{
    e.preventDefault()
    // the last argument is the new url that we want to append to the existing url
    // whenever we call that method
    history.pushState(null, null, "services");
    getServices()

      // now we have our data which is now going to be an array
  })
  // set the class - .show_link
  // reference that paticular dom element
  $(document).on('click', '.show_link', function(e) {
    e.preventDefault()
    // make a call to our backend api endpoint
    $('#app-container').html('')
    let id = $(this).attr('data-id')
    fetch(`/services/${id}.json`)
    // create an data-id attribute in the formatter
    .then(res => res.json())
    .then(service => {
      let newService = new Service(service)
      let serviceHtml = newService.formatShow()
      $('#app-container').append(serviceHtml)
    })
  })
}

const getServices = () => {
  fetch(`/services.json`)// whenever you call fetch you get back a
  // promise and that promise is either going to be resolved or rejected
  // In most cases because we are writing our backend api it is going to be resolved
  // when a promise is resolved with a value you can tag on a method called .then.

    .then(res => res.json())// we need to return that responce and call the .json method on the responce
    // that will parse the data from the responce and return it on to the next .then
    // with data as the argument to its call back
    .then(services => {  // this outputs a list of objects
      // now we have to iterate over these objects that we get back  -> 19:08 - 33:05
      // whenever we click on 'All services' navbar lets clear this app-container

      // 1. clear the html first out from the div app-container -> we want to clear out whatever is inside this box all together with the new service
      // 2. then we can start repainting the dom
        // 2b. to do that we would need to iterate through each one
      $('#app-container').html('')
      services.forEach(service => {// use the responce that we get back from my server
        // and utilize the js model object (please look below)
        // newService will create a new service object that is assign to newService which is a local variable
        // which will have the service attributes for the service object
        let newService = new Service(service)// this will create the service objects each with
        // their own attributes of id,name,description,price,transactions

        //now that we created a newService object we can call
        // the formatIndex method on that prototype because
        // every instance of Service has the ability to be able to
        // call this method on the prototype
        let serviceHtml = newService.formatIndex()
        $('#app-container').append(serviceHtml)
        console.log(newService)
      })
    })
}

// JavaScript model object( with a constructor function or  es6 classes)
// constructor function
// inside our constructor function assign those attributes using this keyword
function Service(service) {
  // this is always going to be whatever object we construct using the new keyword
  this.id = service.id
  this.name = service.name
  this.description = service.description
  this.price = service.price
  this.transactions = service.transactions
}

// Now because we have a constructor function for a service we can start to declear
// different prototype methods on that paticular service and we can do some formatting using those prototype methods

// 1. we reference the model object then prototype and the
//name of the function and we use a function expression for this
// then we build out the markup that we want to display to the user

// Whatever object makes a call to the formatIndex method we have
// access to that objects attributes and the way we refference that
// objects attributes is using the this keyword

// NOTE::::: you can not use arrow functions
// for prototype methods other wize the arrow function is
// going to be scope to window
Service.prototype.formatIndex = function(){
  let serviceHtml = `
    <a href="/services/${this.id}" data-id="${this.id}" class="show_link"><h1>${this.name}</h1></a>
  `
  return serviceHtml
}

// prototype methods = all instance of service can utilize
// that one method

Service.prototype.formatShow = function(){
  let serviceHtml = `
    <h3>${this.name}</h3>
  `
  return serviceHtml
}

// changing the url:
 // I want to also change the url of the page as well:
 // we need to use the history object.
 // history.pushState(null, null, "services");

// for show - summery:
// 1. repaints the dom
// 2. makes a call to my backend api server
// 3. and returns that json

//38:26!!
