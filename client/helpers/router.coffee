Meteor.Router.add
  '/': 'talksPage'

  '/talks/new':
    to: 'talksNew'
    and: -> Session.set('talkKind', 'tech')

  '/talks/:_id/edit':
    to:  'talksEdit'
    and: (id) -> Session.set('currentTalkId', id)

Meteor.Router.filters
  'requireLogin': (page) ->
    if Meteor.user()
      page
    else
      'accessDenied'

Meteor.Router.filter 'requireLogin',
  only: ['talksNew', 'talksEdit']
