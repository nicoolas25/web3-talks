Meteor.Router.add
  '/':           'talksPage'
  '/talks/new':  'talksNew'

Meteor.Router.filters
  'requireLogin': (page) ->
    if Meteor.user()
      page
    else
      'accessDenied'

Meteor.Router.filter 'requireLogin',
  only: 'talksNew'
