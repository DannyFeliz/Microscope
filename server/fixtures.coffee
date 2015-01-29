if Posts.find().count() is 0
  now = getCurrentDate()

  tomId = Meteor.users.insert({
    profile: { name: 'Tom Coleman' }
  })

  tom = Meteor.users.findOne(tomId)
  sachaId = Meteor.users.insert({
    profile: { name: 'DanyFelz' }
  })
  sacha = Meteor.users.findOne(sachaId)

  telescopeId = Posts.insert({
    title: 'Programmers social media'
    userId: sacha._id
    author: sacha.profile.name
    url: 'https://www.github.com/'
    submitted: now
    commentsCount: 2
    upvoters: []
    votes: 0
  })

  Comments.insert({
    postId: telescopeId
    userId: tom._id
    author: tom.profile.name
    submitted: now
    body: 'El mejor lugar para compatir codigo'
  })

  Comments.insert({
    postId: telescopeId
    userId: sacha._id
    author: sacha.profile.name
    submitted: now
    body: 'Completamente de acuerdo.'
  })

  Posts.insert({
    title: 'Meteor'
    userId: tom._id
    author: tom.profile.name
    url: 'http://meteor.com'
    submitted: now
    commentsCount: 0
    upvoters: []
    votes: 0
  })

  Posts.insert({
    title: 'Aprender Git'
    userId: tom._id
    author: tom.profile.name
    url: 'http://git-scm.com'
    submitted: now
    commentsCount: 0
    upvoters: []
    votes: 0
  })
###
i = 0
while i < 10
  Posts.insert
    title: 'Cuanta Razon page '+(i+1)
    userId: "QJoftmcMxo4vKnHqn"
    author: "DanyFelz"
    url: 'http://www.cuantarazon.com/ultimos/p/'+(i+1)
    submitted: getCurrentDate()
    commentsCount: 0
    upvoters: []
    votes: 0
  i++###

