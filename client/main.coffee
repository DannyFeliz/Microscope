Meteor.subscribe "posts"

Meteor.startup ->
  Tracker.autorun ->
    console.log "There "+ Posts.find({}).count()