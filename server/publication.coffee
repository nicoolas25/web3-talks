# Publish to the clients every talks
Meteor.publish 'talks', ->
  Talks.find()

# Publish to the clients every votes hiddin their owner
Meteor.publish 'votes', ->
  Votes.find({}, fields: {userId: false, createdAt: false})

# Publish to the clients only its own roles
Meteor.publish 'roles', ->
  Roles.find({userId: @userId})
