Template.talksEdit.helpers
  talk: ->
    Talks.findOne(Session.get('currentTalkId'))

Template.talksEdit.events
  'click input.delete': (event) ->
    event.preventDefault()

    if confirm("Voulez vous vraiment supprimer ce talk ?")
      talk =
        _id: Session.get('currentTalkId')

      Meteor.call 'talks/destroy', talk, (error) ->
        if error
          Meteor.Router.to('talksEdit', talk)
          alert error

      Meteor.Router.to('talksPage')

  'submit form': (event) ->
    event.preventDefault()

    title_elt = -> document.getElementById('new-talk-title')
    descr_elt = -> document.getElementById('new-talk-description')
    talk =
      _id:         Session.get('currentTalkId')
      title:       title_elt().value
      description: descr_elt().value

    Meteor.call 'talks/patch', talk, (error, id) ->
      if error
        Meteor.Router.to('talksEdit', talk)
        alert error

    Meteor.Router.to('talksPage')
