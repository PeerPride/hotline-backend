# frozen-string_literal: true

Redis.current = Redis.new(
  url: ENV['REDIS_URL'],
  port: ENV['REDIS_PORT'],
  db: ENV['REDIS_URL']
)

Rails.cache.write(:online_users, [])
