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
      username = App.router.get('userController.content.username')
      message = {text: text, username: username}
      App.router.say(message)
                          
      @$('#sayText').val('').focus()