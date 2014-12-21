Template.postItem.helpers
  domain: ->
    a = document.createElement("a")
    a.href = @url
    a.hostname
  title: ->
    title = @title.toUpperCase()
    title

Template.postsList.helpers
  posts: ->
    Posts.find()

