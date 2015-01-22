@Posts = new Mongo.Collection "posts"

@validatePost = (postAttribute) ->
  errors = {}
  errors.title = "Please fill in a headline"  unless postAttribute.title
  errors.url = "Please fill in a URL"  unless postAttribute.url

  errors


Posts.allow
  update: (userId, doc) ->
    return doc and doc.userId is userId
  remove: (userId, doc) ->
    return doc and doc.userId is userId

Posts.deny
  update: (userId, post, fieldNames, modifier) ->
    errors = validatePost(modifier.$set)
    return errors.title or errors.url



Meteor.methods
  postInsert: (postAttribute) ->
    console.log(Meteor.userId())
    expect(Meteor.userId()).to.be.a("String")
    console.log "Titulo: #{postAttribute.title}"
    expect(postAttribute.title).to.be.a("String")
    expect(postAttribute.url).to.be.a("String")

    user = Meteor.user()
    post = _.extend(postAttribute, {
      userId: user._id
      author: user.username
      submitted: @getCurrentDate
    })
    error = validatePost(postAttribute)
    if error.title or error.url
      throw new Meteor.Error("invalid-post","Debes introducir un titulo y una URL","No pueden estar vacio")
    postWithSameLink = Posts.findOne({url: postAttribute.url})
    if postWithSameLink
      return{
        postExists: true
        _id: postWithSameLink._id
        author: user.username
      }

    postId = Posts.insert(post)

    return {
      _id: postId
    }

