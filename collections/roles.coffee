@Roles = new Meteor.Collection('roles')

# The roles are managed with the mongo console
@Roles.deny
  update: -> true
  remove: -> true
  insert: -> true




