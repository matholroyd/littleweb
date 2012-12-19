App.MessagesController = Ember.ArrayController.extend
  content: []
  
  said: (message) ->
    @get('content').pushObject(message)
