module Service
  module Cache
    require 'active_support/time'

    def self.set(key, value, expires_at=Time.now + 2.minutes)
      Padrino.cache[key] = {
        value: value,
        expires_at: expires_at
      }
      value
    end

    def self.get(key)
      cache_property = Padrino.cache[key]
      return cache_property if cache_property.nil?
      return cache_property[:value] if Time.now < cache_property[:expires_at]
      Padrino.cache.delete('key')
      nil
    end
    
  end
end