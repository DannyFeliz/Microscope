Template.postsList.helpers
  posts: ->
    Posts.find({}, {sort: {submitted: -1}})
  log: ->
    console.log @

