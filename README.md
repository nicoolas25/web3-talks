# Web3-talks

Cette application sert à rassembler et à voter les propositions de talks
pour le meetup Web3. L'application sert également de support pour une
présentation de [Meteor][meteor] à cette même rencontre.

# Fonctionnement

L'application permet de visualiser les talks proposés ainsi que leurs
nombre de votes. S'identifier avec un compte Google ou Github permet
de voter et de proposer des talks.

On ne peut voter qu'une seule fois pour un même talk mais on peut
voter pour autant de talks que l'on veut. Il n'est pas possible de
retirer un de ses votes.

Les talks ont un statut qui prend les valeurs suivantes :

* Candidat
* Confirmé
* Réalisé

Il n'est possible de voter que pour les présentations candidates.

# Déploiement

L'application peut être déployée sur Heroku facilement à l'aide d'un
buildpack. J'utilise [un fork][fork] de [heroku-buildpack-meteorite][hbm]
afin de remplacer MongoHQ par MongoLab et bénéficier d'une formule
gratuite en Europe (ce que ne propose pas MongoHQ).

Bref, pour déployer sur heroku il vous faudra créer une application
heroku, ajouter le remote au dépot et y ajouter le buildpack :

    heroku git:remote -a web3-talks
    heroku config:add BUILDPACK_URL=https://github.com/nicoolas25/heroku-buildpack-meteorite.git

Il vous faudra également définir l'URL de l'application (pour que Meteor
puisse construire des liens corrects) avec la commande :

    heroku config:add ROOT_URL=http://web3-talks.herokuapp.com

Enfin il suffit de pusher les sources de l'application telles qu'elles
sont dans ce dépot :

    git push heroku

[meteor]: http://www.meteor.com/
[fork]: https://github.com/nicoolas25/heroku-buildpack-meteorite
[hbm]: https://github.com/oortcloud/heroku-buildpack-meteorite
