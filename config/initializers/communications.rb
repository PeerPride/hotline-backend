# frozen_string_literal: true

begin
  @telephonyClient = Communications::CommunicationsManager.instance
rescue InvalidCommsProviderException => e
  @telephonyClient = nil
  puts e.message
end
