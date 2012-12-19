App.MessagesController = Ember.ArrayController.extend
  content: []
  
  said: (message) ->
    @get('content').insertAt(0, message)

  load: (messages) ->
    for text in messages
      message = {text: text}
      @get('content').pushObject(message)