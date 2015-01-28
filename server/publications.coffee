Meteor.publish "posts", ->
  options = {
    sort: {submitted: -1}
  }

  Posts.find({}, options)

Meteor.publish "comments", (postId) ->
  expect(postId).to.be.a("string")
  Comments.find(postId: postId)

Meteor.publish "notifications", ->
  Notifications.find({userId: @userId, read: false})



















