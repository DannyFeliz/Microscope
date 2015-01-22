
@getCurrentDate = ->
  moment().locale("es")
  currentDate = moment.utc()._d
  currentDate = moment().format("dddd, MMMM Do YYYY, h:mm:ss a")
  console.log "Fecha: #{currentDate}"
  return currentDate