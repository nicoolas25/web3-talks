@Talks = new Meteor.Collection('talks')

@Talks.allow
  update: ownDocument
  remove: ownDocument

@Talks.deny
  update: (userId, talk, fieldNames) ->
    # Deny the update if there is other fields than title and description
    _.without(fieldNames, 'title', 'description').length > 0

# All methods will run on server side and
# will be simulated on client too.
Meteor.methods

  # This method creates the talk
  'talks/create': (talkAttributes) ->
    user = Meteor.user()

    if not user
      throw new Meteor.Error(401, 'Vous devez être identifié pour proposer un talk.')

    if not talkAttributes.title
      throw new Meteor.Error(422, 'Vous devez donner un titre à votre talk.')

    # Filter only the permitted attributes
    talk = _.pick(talkAttributes, 'title', 'description')

    # Add some attributes on server side
    talk =_ .extend talk,
      userId:    user._id
      speaker:   user.profile.name
      createdAt: new Date().getTime()

    # This demonstrate the latence compensation, see client/views/talks/talks_new.coffee
    #
    # unless @isSimulation
    #   Future = Npm.require('fibers/future')
    #   future = new Future()
    #   Meteor.setTimeout((-> future.return()), 5000)
    #   future.wait()

    talk._id = Talks.insert(talk)

    return talk._id
