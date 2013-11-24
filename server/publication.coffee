Meteor.publish 'talks', ->
  Talks.find {},
    fields:
      public: false
