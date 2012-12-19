App.MessageCenter = Ember.Object.extend

  init: ->
    @_super()
    @setupPusher()
  
  setupPusher: ->
    pusher = new Pusher(@get('pusher_key'))
    channel = pusher.subscribe(@get('channel_name'))
    channel.bind 'client-chat', (message) =>
      App.router.get('messagesController').said(message)
    
    @set('pusher', pusher)
    @set('channel', channel)

  say: (message) ->
    @get('channel').trigger('client-chat', message)
