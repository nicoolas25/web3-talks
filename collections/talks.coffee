@Talks = new Meteor.Collection('talks')

@Talks.allow
  insert: (userId, obj) -> not not userId
