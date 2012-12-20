App.SayView = Ember.View.extend
  templateName: 'say'
  tagName: "form"  
  classNames: ["sayForm"]
  
  submit: (event) ->
    @sendMessage()
    event.stopPropagation()
    
  sendMessage: ->
    text = @$('#sayText').val()
    if text.trim().length > 0
      message = {text: text}
      App.router.say(message)
                          
      @$('#sayText').val('').focus()