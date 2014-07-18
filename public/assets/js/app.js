(function() {
  window.FA = Ember.Application.create({
    LOG_TRANSITIONS: true,
    LOG_ACTIVE_GENERATION: true,
    LOG_VIEW_LOOKUPS: true
  });

  FA.API_BASE = '/api/v1';

}).call(this);

(function() {
  FA.CheeseController = Ember.ObjectController.extend();

}).call(this);

(function() {
  FA.IndexController = Ember.ObjectController.extend();

}).call(this);

(function() {
  if (Modernizr.history) {
    FA.Router.reopen({
      location: 'history'
    });
  }

  FA.Router.reopen({
    notifyGoogleAnalytics: (function() {
      var url;
      url = this.get('url');
      if (ga) {
        return ga('send', 'pageview', url);
      }
    }).on('didTransition')
  });

  FA.Router.map(function() {
    return this.route("no_route", {
      path: "*path"
    });
  });

  FA.Route = Ember.Route.extend({
    beforeModel: function(transition) {
      return console.log("beforeModel");
    },
    actions: {
      setPageTitle: function(title) {
        return $('title').html(title);
      },
      error: function(reason, transition) {
        if (reason.status === 404) {
          return this.transitionTo('not_found');
        } else {
          return console.log(reason);
        }
      }
    }
  });

  FA.IndexRoute = FA.Route.extend({
    model: function(params) {
      var self;
      self = this;
      return {};
    },
    setupController: function(controller, model) {
      return controller.set('model', model);
    }
  });

}).call(this);
