
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
    $('#app-container').html('')
    // create an data-id attribute in the formatter
    let id = $(this).attr('data-id')

    // make a call to our backend api endpoint
    fetch(`/services/${id}.json`)
    .then(res => res.json())
    .then(service => {
      serviceId = service.id
      console.log(serviceId)

      let newService = new Service(service)
      let serviceHtml = newService.formatShow()
      $('#app-container').append(serviceHtml)

      service.ais.forEach(ai => {

      //new use the responce that I get back from my server and utilize a javascript model object
      // either with a constructor function or es6 classes
      let newAi = new Ai(ai)
      // we created a new post object we can call this paticular method on that prototype. Every instance of post has
      // the ability to call the formatIndex method on the prototype
      let aiHtml = newAi.formatShow()
      // postHtml is a html markup
      //we are appending that to #app-container
      $('#app-container').append(aiHtml)
      })
  })

    // fetch(`/ais/${id}.json`)
    // // create an data-id attribute in the formatter
    // .then(res => res.json())
    // .then(ai => {
    // })


  })
// user -< ais -< transaction >- service
// has many transactions
  // $(document).on('click', '.show_link', function(e) {
  //   e.preventDefault()
  //   $('#app-container').html('')
  //   // create an data-id attribute in the formatter
  //   let id = $(this).attr('data-id')
  //       // debugger
  //   // make a call to our backend api endpoint
  //   fetch(`/ais/${id}.json`)
  //   .then(res => res.json())
  //   .then(ai => {
  // // debugger
  //     let newAi = new Ai(ai)
  //     let aiHtml = newAi.formatShow()
  //     $('#app-container').append(aiHtml)
  //     })
  // })

  $(document).on('click', 'next-service', function() {
    // make a call to our backend api endpoint
    let id = $(this).attr('data-id')
    fetch(`services/${id}/next`)

    // console.log("nexttt!!!!")
  })

  // I want to select my form which has an id of new_service
  // and I want to have a listener for
  // on submit because it is a form. so the events that forms usually have is
  // a submit event. Pass in the event object
  $('#new_service').on('submit', function(e){
    // pervent the default I just want the form submittion to
    // pause automatically
    e.preventDefault()
    // Now I have hijacked the submittion of this paticular service
    // console.log("submitting service")
    // Next I want to grab the values that I input into this form we
    // can do that with jquary with a method called seralize

    // I am going to wrap the this which is in this case the form in a jquary object
    // this is the form it self and I am wraping it in this jquary
    // console.log($(this).serialize())// this will serialize my form data it should look like this:
    // this serialize the information that I put into the form and will allow us to then send back to our server
    //I am going to save this in a variable called values.
    //utf8=%?????&authenticity_token=?????????????????????????service%name%=??????????????service%?????????????description%????????????service%????????????price%??????????
    const values = $(this).serialize()
    // now I can make a post request to my backend
    // and because this is a restful app to create a new service it is going to be a post request to /services
    // the next thing that we are going to need to pass in is our data
    // in our case its the seralized data that we saved in a variable called
    // values
    // once we are sussful with posting we can chain a method called
    // .done which takes in a callback function that gives us
    // the data that is returned to us from the server
    //Go to the service controller and go to the create action.

    // once I am successful with posting to my backend
    // then
    // 06:08
    $.post("/services",values).done(function(data) {
      // then clear out that div
      $('#app-container').html('')
      // then I can repaint the dom how ever I see fit
      // now we replaced everything inside that div with whatever we want
      // this all happens without a page refresh
      // what I want to do is to display that new service information
      // so I am going to take advantage of my model object that I created
      // down here for a service constructor
      // console.log(data)

      const newService = new Service(data)// my Service constructor takes in a service
      // and extracts all of those values and assigns its properties and since I have a
      // method on the prototype called formatShow, I am going to reuse my formatShow
      // prototype method to display that now service information

      // formatShow returns html so
      const htmlToAdd = newService.formatShow()
      // I can then append to my app container a html tag
      $('#app-container').html(htmlToAdd) // 11:45
    })
//
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
      //console.log(services)
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
        //console.log(newService)
      })
    })
}

// ///// malcome beginning
// const getAis = () => {
//   fetch(`/ais/${id}.json`)
// debugger
//     .then(res => res.json())
//     .then(services => {
//       $('#app-container').html('')
//       services.forEach(service => {
//         let newService = new Service(service)
//         let serviceHtml = newService.formatIndex()
//         $('#app-container').append(serviceHtml)
//       })
//     })
// }
// ///// malcome end

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
  this.ais = service.ais
  this.users = service.users

}

function Ai(ai) {
  // this is always going to be whatever object we construct using the new keyword
  this.id = ai.id
  this.name = ai.name
  this.user = ai.user
  this.description = ai.description
  this.balance = ai.balance
  this.transactions = ai.transactions
  this.services = ai.services


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
    <b>hi from js 😁 </b>
    <a href="/services/${this.id}" data-id="${this.id}" class="show_link"><h9>${this.name}</a> (price: ${this.price} - ${this.description}) </h9><br>
  `
  return serviceHtml
}

// prototype methods = all instance of service can utilize
// that one method

Service.prototype.formatShow = function(){
  let serviceHtml = `
  <b>hi from js 😁 </b><br>
  <b>Service.prototype </b><br>
  <b>Number of AIs that used this Service:></b><br>
  <br>
  id of service: $ ${this.id}!!!!!!!! </p>
  Name of service: ${this.name} </p>
  <p>Description:${this.description}.......</p>
  <br/><br/>
  <p>-------------------------------------------------------------</p>

  <p>-------------------------------------------------------------</p>
  <button class="next-service" >Next</button>
  <br>
  `
  return serviceHtml
}
Ai.prototype.formatShow = function(){
  let aiHtml = `
  <b>hi from js 😁 </b><br>
  <b>Ai.prototype </b><br>

  <br>
  id of Ai: $ ${this.id}!!!!!!!! </p>
  Name of Ai: $ ${this.name}!!!!!!!! </p>
  Description: $ ${this.description} !!!!!!!</p>

  `
  return aiHtml
}
// Ai.prototype.formatShow = function(){// malcome just added
//   let aiHtml = `
//   <p>An Ai:</p>
//   ........... - ${this.name} - ..........
//   `
//   return aiHtml
// }//end malcome just added

// changing the url:
 // I want to also change the url of the page as well:
 // we need to use the history object.
 // history.pushState(null, null, "services");

// for show - summery:
// 1. repaints the dom
// 2. makes a call to my backend api server
// 3. and returns that json

//38:26!!

// form summittion: submitting a form via ajax
// service.ais[0].id
