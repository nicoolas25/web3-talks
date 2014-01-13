Template.talksEdit.helpers
  talk: ->
    Talks.findOne(Session.get('currentTalkId'))

  kindIsTech:    -> @kind is 'tech'
  kindIsNonTech: -> @kind is 'non-tech'

Template.talksEdit.events
  'change select#edit-talk-kind': (event) ->
    select = event.target
    $(select).closest('form')
      .toggleClass(@kind)
      .toggleClass(select.value)
    @kind = select.value

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

    talkId = Session.get('currentTalkId')
    talk =
      title:       document.getElementById('edit-talk-title').value
      kind:        document.getElementById('edit-talk-kind').value
      description: document.getElementById('edit-talk-description').value

    Talks.update talkId, {$set: talk}, (error) ->
      if error
        alert(error.reason)
      else
        Meteor.Router.to('talksPage')
