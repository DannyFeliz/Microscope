Template.postEdit.events
  "submit form": (e) ->
    e.preventDefault()

    currentPostId = @._id
    postProperties =
      title : $(e.target).find("[name=title]").val()
      url : $(e.target).find("[name=url]").val()

    expect(postProperties.title).to.be.a("string")
    expect(postProperties.url).to.be.a("string")

    Posts.update({_id:currentPostId},{$set:postProperties}, (error) ->
      if error
        alert error.reason
      else
        Router.go "pagePost", {_id: currentPostId}
    )
  "click .delete": (e) ->
    e.preventDefault()

    if confirm("Delete this post?")
      currentPostId = @._id
      Posts.remove(currentPostId)
      Router.go("postList")