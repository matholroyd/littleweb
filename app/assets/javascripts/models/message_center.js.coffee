App.MessageCenter = Ember.Object.extend

  init: ->
    @_super()
    @setupPusher()
    @set('soundEffects', App.SoundEffects.create())
  
  setupPusher: ->
    pusher = new Pusher(@get('pusher_key'))
    channel = pusher.subscribe(@get('channel_name'))
    channel.bind 'client-chat', (message) =>
      App.router.get('messagesController').said(message)

    channel.bind 'client-sound', (sound) =>
      @get('soundEffects').play(sound)
    
    @set('pusher', pusher)
    @set('channel', channel)

  say: (message) ->
    @get('channel').trigger('client-chat', message)
    
    $.ajax
      url: "/place/#{@get('place')}/messages"
      type: 'POST'
      data: {message: message}

  sendSound: (sound) ->
    @get('soundEffects').play(sound)
    @get('channel').trigger('client-sound', sound)
    
  loadMessages: ->
    $.ajax
      url: "/place/#{@get('place')}/messages"
      success: (data, status, event) ->
        App.router.get('messagesController').load(data.messages)