App.MessagesController = Ember.ArrayController.extend
  content: []
  
  said: (message) ->
    @get('content').insertAt(0, message)

  load: (messages) ->
    if !@get('content.length') > 0
      for message in messages
        @get('content').pushObject(message)