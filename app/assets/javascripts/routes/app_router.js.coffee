App.Router = Ember.Router.extend
  location: 'hash'
  enableLogging: false

  showSignIn: Ember.Route.transitionTo('messages.signIn')
  
  say: (message) ->
    App.router.get('messagesController').said(message)
    App.get('messageCenter').say(message)

  sendMusic: -> App.get('messageCenter').sendSound('music')

  root: Ember.Route.extend
    
    index: Ember.Route.extend
      route: '/'
      connectOutlets: (router) ->
        router.transitionTo('messages.index')
        
    messages: Ember.Route.extend
      route: '/messages'
      connectOutlets: (router) ->
        user = App.User.create()
        user.find()
        router.get('applicationController').connectOutlet('user', 'user', user)

      index: Ember.Route.extend
        route: '/'
        connectOutlets: (router) ->
          router.get('applicationController').connectOutlet('messages')
          router.get('messagesController').connectOutlet('say')
          App.get('messageCenter').loadMessages()

      signIn: Ember.Route.extend
        connectOutlets: (router) ->
          router.get('applicationController').connectOutlet('overlay', 'signIn')

      closeSignIn: Ember.Route.extend
        enter: =>
          App.router.get('applicationController').disconnectOutlet('overlay')

