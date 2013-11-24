Template.talksNew.events
  'submit form': (event) ->
    # Prevent the browser to submit the form
    event.preventDefault()

    title_elt = -> document.getElementById('new-talk-title')
    descr_elt = -> document.getElementById('new-talk-description')
    # Prepare the data contained in the form
    talk =
      title:       title_elt().value
      description: descr_elt().value

    # Remote call to the server
    Meteor.call 'talks/create', talk, (error, id) ->
      if error
        # Go back to the talksNew view
        Meteor.Router.to('talksNew')

        # Refill the form with given values
        title_elt().value = talk.title
        descr_elt().value = talk.description

        # Display an alert with the error message
        alert error

    # Latency compensation
    Meteor.Router.to('talksPage')
