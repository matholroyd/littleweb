App.UserView = Ember.View.extend
  templateName: 'user'
  tagName: 'section'
  classNames: ['user']
    
  hasUsername: ->
    !Ember.empty(@get('controller.content.username'))
