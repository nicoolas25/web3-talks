Template.talksNew.events
  'submit form': (event) ->
    event.preventDefault()
    talk =
      speaker:     Meteor.user().profile.name
      title:       document.getElementById('new-talk-title').value
      description: document.getElementById('new-talk-description').value
    Talks.insert(talk)
    Meteor.Router.to('talksPage')
