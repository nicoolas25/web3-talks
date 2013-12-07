Meteor.startup ->
  Talks.find().observe
    # Remove votes associated votes
    removed: (talk) -> Votes.remove({talkId: talk._id})

