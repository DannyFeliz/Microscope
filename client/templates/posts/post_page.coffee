Template.postPage.helpers
  comments: ->
    console.log "ID: "+@_id
    Comments.find postId: @_id
