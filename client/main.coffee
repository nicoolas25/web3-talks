# The client should sync its talk collection, see server/publication.coffee
Meteor.subscribe('talks')
Meteor.subscribe('votes')
Meteor.subscribe('roles')
