if Modernizr.history
  FA.Router.reopen
    location: 'history'

FA.Router.reopen

  notifyGoogleAnalytics: ( ->
    url = @get 'url'
    ga 'send', 'pageview', url if ga
  ).on 'didTransition'

FA.Router.map () ->

  @route "no_route", path: "*path"

######

FA.Route = Ember.Route.extend

  beforeModel: (transition) ->
    console.log "beforeModel"

  actions:

    setPageTitle: (title) ->
      $('title').html title

    error: (reason, transition) ->
      if reason.status == 404
        @transitionTo 'not_found'
      else
        console.log reason

##########

FA.IndexRoute = FA.Route.extend

  model: (params) ->
    self = @
    {}

  setupController: (controller, model) ->
    controller.set 'model', model
