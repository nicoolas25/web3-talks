Template.talksList.helpers
  talks: -> Talks.find({}, {sort: {created_at: -1}})
