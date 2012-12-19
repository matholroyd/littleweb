App.SayView = Ember.View.extend
  templateName: 'say'
  classNames: ["sayForm"]
  
  sendMessage: ->
    text = @$('#sayText').val()
    if text.trim().length > 0
      message = {text: text}
      App.router.say(message)
                          
      @$('#sayText').val('').focus()