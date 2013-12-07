Meteor.startup ->
  if Votes.find().count() is 0
    talk = Talks.findOne({})
    user = Meteor.users.findOne({})

    Votes.insert
      talkId: talk._id
      userId: user and user._id
      createdAt: new Date().getTime()
