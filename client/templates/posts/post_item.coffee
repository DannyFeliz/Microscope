Template.postItem.helpers
  domain: ->
    a = document.createElement("a")
    a.href = @url
    a.hostname

  log: ->
    console.log @

Template.layout.events
  'click .isSelected': ->
    if isSelected
      console.log "Estoy seleccionado"
    else
