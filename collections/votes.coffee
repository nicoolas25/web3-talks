@Votes = new Meteor.Collection('votes')

# The vote are managed by method only
@Votes.deny
  update: -> true
  remove: -> true
  insert: -> true

Meteor.methods

  'votes/create': (voteAttributes) ->
    user = Meteor.user()

    if not user
      throw new Meteor.Error(401, 'Vous devez être identifié pour voter.')

    if not voteAttributes.talkId
      throw new Meteor.Error(422, 'Vous devez voter pour un talk.')

    if Votes.find({userId: user._id, talkId: voteAttributes.talkId}).count() isnt 0
      throw new Meteor.Error(422, 'Vous avez déjà voté pour ce talk.')

    # Filter only the permitted attributes
    vote = _.pick(voteAttributes, 'talkId')

    # Add some attributes on server side
    vote =_ .extend vote,
      userId:    user._id
      createdAt: new Date().getTime()

    vote._id = Votes.insert(vote)

    return vote._id
