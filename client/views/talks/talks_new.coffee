Template.talksNew.events
  'submit form': (event) ->
    # Prevent the browser to submit the form
    event.preventDefault()

    titleElt = -> document.getElementById('new-talk-title')
    descrElt = -> document.getElementById('new-talk-description')

    # Prepare the data contained in the form
    talk =
      title:       titleElt().value
      description: descrElt().value

    # Remote call to the server
    Meteor.call 'talks/create', talk, (error, id) ->
      if error
        # Go back to the talksNew view
        Meteor.Router.to('talksNew')

        # Refill the form with given values
        titleElt().value = talk.title
        descrElt().value = talk.description

        # Display an alert with the error message
        alert error

    # Latency compensation
    Meteor.Router.to('talksPage')
