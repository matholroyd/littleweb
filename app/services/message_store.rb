class MessageStore
  def initialize(place)
    @place = place
  end
  
  def get_messages
    messages = []
    redis do |r|
      messages = r.lrange(key, 0, AppConfig.messages_to_store - 1)
      messages.map! { |m| JSON.parse(m) }
    end
    {messages: messages}
  end
  
  def add_message(message)
    redis do |r|
      r.lpush(key, message.to_json)
      r.ltrim(key, 0, AppConfig.messages_to_store - 1)
    end
  end
  
  private
  
  def key
    "#{@place}:messages"
  end
    
  def redis
    redis = Redis.new(url: AppConfig.redis.url)
    yield(redis)
    redis.client.disconnect
  end
end