App.User = Ember.Object.extend
  username: null
  
  updateCookie: ( ->
    if !Ember.empty(@get('username'))
      $.cookie('user.username', @get('username'))
  ).observes('username')
  
  find: ->
    if Ember.empty(@get('username'))?
      username = $.cookie('user.username')
      if username?
        @set('username', username)
      else
        App.router.transitionTo('signIn')
    