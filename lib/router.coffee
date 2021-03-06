Router.configure
  layoutTemplate: 'layout',
  loadingTemplate: 'loading',
  noFoundTemplate: 'noFound',
  waitOn: ->
    return [Meteor.subscribe('posts'),Meteor.subscribe('notifications')]

Router.route "/posts/:_id",
  name: 'postPage',
  waitOn: ->
    Meteor.subscribe('comments', @params._id)
  data: ->
    Posts.findOne(_id:@params._id)

Router.route "/submit",
  name: 'postSubmit'

Router.route "/posts/:_id/edit",
  name: "postEdit",
  data: ->
    Posts.findOne(_id:@params._id)


Router.route "/author/:username",
  name: 'postByAuthor',

  data: ->
    allByAuthor: Posts.find({author:@params.username})

Router.route "/",
  name: 'postsList'
  data: ->
      posts: Posts.find({},{sort: {"submitted": 1}})

requireLogin = ->
  unless Meteor.userId()
    if Meteor.loggingIn()
      @render.loadingTemplate
      @next()
    else
      @render "accessDenied"
  else
    @next()

Router.onBeforeAction 'loading'
Router.onBeforeAction('dataNotFound', {only: 'postPage'})
Router.onBeforeAction requireLogin, {only: "postSubmit"}

