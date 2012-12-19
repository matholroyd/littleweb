App.Router = Ember.Router.extend
  location: 'hash'
  enableLogging: false

  root: Ember.Route.extend
    index: Ember.Route.extend
      route: '/'
      connectOutlets: (router) ->
        router.transitionTo('messages.index')
    
    messages: Ember.Route.extend
      route: '/messages'

      index: Ember.Route.extend
        route: '/'
        
        connectOutlets: (router) ->
          router.get('applicationController').connectOutlet('messages')
          
