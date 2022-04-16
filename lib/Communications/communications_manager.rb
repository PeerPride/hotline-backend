# frozen_string_literal: true

require 'singleton'

# :nodoc:
module Communications
  # Provides a singleton object representing the client of the provider.
  class CommunicationsManager
    include Singleton
    # Controller model for voice/sms/mms/etc
    @communications_rovider = nil

    def initialize
      @communications_rovider = nil
      begin
        provider_name = Setting.where(name: 'Phone Provider').first.value
        obj = "Communications::#{provider_name}::#{provider_name}Controller".constantize
        @communications_provider = obj.new
      rescue NameError => e
        raise InvalidCommsProviderException, "Phone provider does not exist #{e}"
      end
    end

    def provider_object
      @communications_provider
    end
  end
end
