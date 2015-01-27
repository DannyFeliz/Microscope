Meteor.publish "posts", (options) ->
  expect(options.sort).to.be.an("object")
  expect(options.limit).to.be.a("Number")
  Posts.find({}, options)

Meteor.publish "comments", (postId) ->
  expect(postId).to.be.a("string")
  Comments.find(postId: postId)

Meteor.publish "notifications", ->
  Notifications.find({userId: @userId, read: false})



















