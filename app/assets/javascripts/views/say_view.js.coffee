App.SayView = Ember.View.extend
  templateName: 'say'
  
  sendMessage: ->
    text = @$('#sayText').val()
    message = {text: text}
    App.router.say(message)
                          
    @$('#sayText').val('').focus()