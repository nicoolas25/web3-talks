# Publish to the clients every talks
Meteor.publish 'talks', -> Talks.find()
