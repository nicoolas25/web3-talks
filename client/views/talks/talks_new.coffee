titleElt = -> document.getElementById('new-talk-title')
kindElt  = -> document.getElementById('new-talk-kind')
descrElt = -> document.getElementById('new-talk-description')

Template.talksNew.helpers
  talkKind: -> Session.get('talkKind')

Template.talksNew.events
  'change select#new-talk-kind': (event) ->
    Session.set('talkKind', kindElt().value)

  'submit form': (event) ->
    # Prevent the browser to submit the form
    event.preventDefault()

    # Prepare the data contained in the form
    talk =
      title:       titleElt().value
      description: descrElt().value
      kind:        kindElt().value

    # Remote call to the server
    Meteor.call 'talks/create', talk, (error, id) ->
      if error
        # Go back to the talksNew view
        Meteor.Router.to('talksNew')

        # Set a very small timer to let the browser construct the DOM
        setTimeout ->
          # Refill the form with given values
          titleElt().value = talk.title
          kindElt().value  = talk.kind
          descrElt().value = talk.description

          # Display an alert with the error message
          alert error.reason
        , 100

    # Latency compensation
    Meteor.Router.to('talksPage')
