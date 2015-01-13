
Template.postEdit.events
  "submit form": (e) ->
    e.preventDefault()

    currentPostId = @._id
    postProperties =
      title : $(e.target).find("[name=title]").val()
      url : $(e.target).find("[name=url]").val()

    expect(postProperties.title).to.be.a("string")
    expect(postProperties.url).to.be.a("string")

    errors = validatePost(postProperties)
    Errors.throw("Error",errors)
    if errors.title or errors.url
      return Session.set("postEditErrors",errors)

    Posts.update({_id:currentPostId},{$set:postProperties}, (error) ->
      if error
        Errors.throw(error.reason)
      else
        Router.go "postPage", {_id: currentPostId}
    )

  "click .delete": (e) ->
    e.preventDefault()

    if confirm("Delete this post?")
      currentPostId = @._id
      Posts.remove({_id: currentPostId})
      Router.go("postsList")


Template.postEdit.created = ->
  Session.set('postEditErrors', {})

Template.postEdit.helpers
  errorMessage: (field) ->
    Session.get('postEditErrors')[field]

  errorClass: (field) ->
    (if !!Session.get("postEditErrors")[field] then "has-error" else "")
