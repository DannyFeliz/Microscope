@Comments = new Mongo.Collection('comments')

Meteor.methods
  commentInsert: (commentAttributes) ->
    expect(@userId).to.be.an("String")
    expect(commentAttributes.body).to.be.an("String")
    expect(commentAttributes.postId).to.be.an("String")

    user = Meteor.user();
    post = Posts.findOne(commentAttributes.postId)

    unless post
      throw new Meteor.Error("invalid-comment","You must comment oon a post")

    comment = _.extend(commentAttributes,{
      userId: user._id
      author: user.username
      submitted: getCurrentDate()
    })
    Posts.update(comment.postId, {$inc: {commentsCount: 1}})

    comment._id = Comments.insert(comment)

    createCommentNotification(comment)

    return comment._id