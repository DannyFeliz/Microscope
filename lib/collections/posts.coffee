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
      author: user.profile.name || user.username
      submitted: @getCurrentDate
      commentsCount: 0
      upvoters: []
      votes: 0
    })
    error = validatePost(postAttribute)
    if error.title or error.url
      throw new Meteor.Error("invalid-post","You should introduce a title and an URL","Can't not be empty")
    postWithSameLink = Posts.findOne({url: postAttribute.url})
    if postWithSameLink
      return{
        postExists: true
        _id: postWithSameLink._id
        author: Meteor.user().profile.name || Meteor.user().username
      }

    postId = Posts.insert(post)

    return {
      _id: postId
    }

  upvote: (postId) ->
    post = Posts.findOne(postId)
    throw new Meteor.Error("invalid", "Post not found")  unless post
    throw new Meteor.Error("invalid", "Already upvoted this post")  if _.include(post.upvoters, @userId)
    Posts.update( post._id,{
      $addToSet: {upvoters: @userId}
      $inc: {votes: 1}
      }
    )