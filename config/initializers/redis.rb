# frozen-string_literal: true

# TODO: Redis.current= is deprecated and will be removed in 5.0
Redis.current = Redis.new(
  url: ENV['REDIS_URL'],
  port: ENV['REDIS_PORT'],
  db: ENV['REDIS_URL']
)
