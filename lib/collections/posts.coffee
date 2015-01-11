@Posts = new Mongo.Collection "posts"


Posts.allow
  update: (userId, doc) ->
    return doc and doc.userId is userId
  remove: (userId, doc) ->
    return doc and doc.userId is userId

Posts.deny
  update: (userId, post, fieldNames) ->
    return (_.without(fieldNames, 'url', 'title').length > 0)



Meteor.methods
  postInsert: (postAttribute) ->
    console.log(Meteor.userId())
    expect(Meteor.userId()).to.be.a("String")
    console.log "Titulo: #{postAttribute.title}"
    expect(postAttribute.title).to.be.a("String")
    expect(postAttribute.url).to.be.a("String")

    user = Meteor.user()
    moment().locale("es")
    console.log moment.locale()
    currentDate = moment.utc()._d
    currentDate = moment().format("dddd, MMMM Do YYYY, h:mm:ss a")
    console.log "Fecha: #{currentDate}"

    post = _.extend(postAttribute, {
      userId: user._id
      author: user.username
      submitted: currentDate
    })

    postWithSameLink = Posts.findOne({url: postAttribute.url})
    if postWithSameLink
      return{
        postExists: true
        _id: postWithSameLink._id
      }
    postId = Posts.insert(post)

    return {
      _id: postId
    }

