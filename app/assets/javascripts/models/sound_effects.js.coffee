App.SoundEffects = Ember.Object.extend
  store: {}

  play: (sound) ->
    store = @get('store')
    
    if store[sound]?
      audio = store[sound]
      audio.load()
    else
      switch sound
        when "music"
          audio = new Audio("/assets/cartoon008.wav")

      store[sound] = audio

    if audio?
      audio.play()