Template.talksList.helpers
  candidateTalks:        -> Talks.find({status: 'candidate'}, {sort: {created_at: -1}})
  candidateTalksPresent: -> Talks.find({status: 'candidate'}, {sort: {created_at: -1}}).count() > 0
  acceptedTalks:         -> Talks.find({status: 'accepted'},  {sort: {created_at: -1}})
  acceptedTalksPresent:  -> Talks.find({status: 'accepted'},  {sort: {created_at: -1}}).count() > 0
  doneTalks:             -> Talks.find({status: 'done'},      {sort: {created_at: -1}})
  doneTalksPresent:      -> Talks.find({status: 'done'},      {sort: {created_at: -1}}).count() > 0
