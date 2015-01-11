Template.postSubmit.events
  "submit form":(e) ->
    e.preventDefault()
    post = {
      url: $(e.target).find("[name=url]").val()
      title: $(e.target).find("[name=title]").val()
    }

    Meteor.call("postInsert",post,(error,result) ->
      if error
        console.log error.reason
        throwError(error.reason)

      if result.postExists
        throwError("El post ya existe")
      Router.go "postPage", {_id: result._id}
    )







