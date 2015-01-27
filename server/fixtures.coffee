if Posts.find().count() is 0
  now = getCurrentDate()

  tomId = Meteor.users.insert({
    profile: { name: 'Tom Coleman' }
  })

  tom = Meteor.users.findOne(tomId)
  sachaId = Meteor.users.insert({
    profile: { name: 'Sacha Greif' }
  })
  sacha = Meteor.users.findOne(sachaId)

  telescopeId = Posts.insert({
    title: 'Introducing Telescope'
    userId: sacha._id
    author: sacha.profile.name
    url: 'http://sachagreif.com/introducing-telescope/'
    submitted: now
    commentsCount: 2
  })

  Comments.insert({
    postId: telescopeId
    userId: tom._id
    author: tom.profile.name
    submitted: now
    body: 'Interesting project Sacha can, I get involved?'
  })

  Comments.insert({
    postId: telescopeId
    userId: sacha._id
    author: sacha.profile.name
    submitted: now
    body: 'You sure can Tom!'
  })

  Posts.insert({
    title: 'Meteor'
    userId: tom._id
    author: tom.profile.name
    url: 'http://meteor.com'
    submitted: now
  })

  Posts.insert({
    title: 'The Meteor Book'
    userId: tom._id
    author: tom.profile.name
    url: 'http://themeteorbook.com'
    submitted: now
    commentsCount: 0
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
  i++

###
