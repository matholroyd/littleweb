App.SignInView = Ember.View.extend
  templateName: 'sign_in'
  tagName: 'form'
  classNames: ['overlay']
    
  submit: (event) ->
    event.stopPropagation()
    App.router.transitionTo('closeSignIn')

  didInsertElement: ->
    @$('input[type=text]').focus()
    
    
    
