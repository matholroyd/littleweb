App.User = Ember.Object.extend
  username: ''
  
  find: ->
    name = $.cookie('user.name')
    if name?
      @set('name', name)
    else
      App.router.transitionTo('signIn')
    