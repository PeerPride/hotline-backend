# frozen_string_literal: true

require 'singleton'

module Communications

  class CommunicationsManager
    include Singleton
    # Controller model for voice/sms/mms/etc
    @@communicationsProvider

    def initialize
      @@communicationsProvider = nil
      begin
        providerName = Setting.where(:name => 'Communications Provider').first.value
        obj = "Communications::#{providerName}::#{providerName}Controller".constantize
        @@communicationsProvider = obj.new
      rescue NameError => e
        raise InvalidCommsProviderException.new "Communications provider does not exist #{e}"
      end
    end
  end

  def provider_object
    @communicationsProvider
  end

end
