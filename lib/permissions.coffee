@ownsDocument = (userId, doc) -> doc and doc.userId is userId

@isAdmin = (userId) -> Roles.find({name: 'Admin', userId: userId}).count() > 0
