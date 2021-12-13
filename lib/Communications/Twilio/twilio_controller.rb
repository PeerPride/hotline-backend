# frozen_string_literal: true

module Communications
  module Twilio
    class TwilioController
      @@client
      def initialize
        @@client = nil

        connect

        # self.test_connection
      end

      def connect
        configParams = Setting.where(name: 'Communications Provider Auth').first.value
        configParams = JSON.parse(configParams)

        @@client = ::Twilio::REST::Client.new configParams['api_key_sid'], configParams['api_key_secret'],
                                              configParams['account_sid']
      end

      def test_connection
        @@client.api.accounts.list(limit: 1)
      rescue ::Twilio::REST::RestError => e
        raise InvalidCommsProviderException, "Twilio provider could not connect #{e}"
      end
    end
  end
end
