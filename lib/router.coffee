Router.configure
  layoutTemplate: 'layout',
  loadingTemplate: 'loading',
  noFoundTemplate: 'noFound',
  waitOn: ->
    Meteor.subscribe 'posts'

Router.map ->
  @route 'postsList', {path: "/"}

  @route 'postPage', {path: "/posts/:_id", data: ->
                          Posts.findOne(_id:@params._id)
                      }
  @route 'postSubmit', {path: "/submit"}

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