Template.talksEdit.helpers
  talk: ->
    Talks.findOne(Session.get('currentTalkId'))

Template.talksEdit.events
  'click input.delete': (event) ->
    event.preventDefault()

    if confirm("Voulez vous vraiment supprimer ce talk ?")
      talkId = Session.get('currentTalkId')
      Talks.remove talkId, (error) ->
        if error
          alert(error.reason)
        else
          Meteor.Router.to('talksPage')

  'submit form': (event) ->
    event.preventDefault()

    titleElt = -> document.getElementById('edit-talk-title')
    descrElt = -> document.getElementById('edit-talk-description')

    talkId = Session.get('currentTalkId')
    talk =
      title:       titleElt().value
      description: descrElt().value

    Talks.update talkId, {$set: talk}, (error) ->
      if error
        alert(error.reason)
      else
        Meteor.Router.to('talksPage')
