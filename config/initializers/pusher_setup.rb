require 'pusher'

Pusher.app_id = AppConfig.pusher.app_id
Pusher.key    = AppConfig.pusher.key
Pusher.secret = AppConfig.pusher.secret