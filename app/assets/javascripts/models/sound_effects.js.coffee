App.SoundEffects = Ember.Object.extend
  play: (sound) ->
    switch sound
      when "music"
        audio = new Audio("/assets/cartoon008.wav")
      else
        audio = null

    if audio?
      audio.play()