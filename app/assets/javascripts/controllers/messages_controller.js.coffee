App.MessagesController = Ember.ArrayController.extend
  content: []
  
  said: (message) ->
    @get('content').insertAt(0, message)

  load: (messages) ->
    if !@get('content.length') > 0
      for text in messages
        message = {text: text}
        @get('content').pushObject(message)