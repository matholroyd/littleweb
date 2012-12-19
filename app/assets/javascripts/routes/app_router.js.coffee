App.Router = Ember.Router.extend
  location: 'hash'
  enableLogging: false

  say: (message) ->
    App.router.get('messagesController').said(message)
    App.get('messageCenter').say(message)

  root: Ember.Route.extend
    
    index: Ember.Route.extend
      route: '/'
      connectOutlets: (router) ->
        router.transitionTo('messages.index')
    
    messages: Ember.Route.extend
      route: '/messages'

      connectOutlets: (router) ->
        router.get('applicationController').connectOutlet('say', 'say')

      index: Ember.Route.extend
        route: '/'
        
        connectOutlets: (router) ->
          messages = [{text: "blah blah"}]
          router.get('applicationController').connectOutlet('messages', messages)
          
