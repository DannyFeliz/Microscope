Template.meteorErrors.helpers
  errors: ->
    Errors.collection.find()

Template.meteorError.rendered = ->
  error = @data
  Meteoer.setTimeout(->
    Errors.collection.remove(error._id)
  ,3000)