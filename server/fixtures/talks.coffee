Meteor.startup ->
  if Talks.find().count() is 0
    Talks.insert
      title: "Introduction à Meteor"
      speaker: "Nicolas Zermati"
      description: "Découvrez Meteor au travers de la réalisation du site de Web3."

    Talks.insert
      title: "Meteor en détails"
      speaker: "Nicolas Zermati"
      description: "Continuez à découvrir Meteor au travers de la réalisation du site de Web3."
