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
        configParams = Setting.where(name: 'Phone Provider Settings').first.value
        configParams = JSON.parse(configParams)

        @@client = ::Twilio::REST::Client.new configParams['account_sid'],
                                              configParams['auth_token']
      end

      def test_connection
        @@client.api.accounts.list(limit: 1)
        rescue ::Twilio::REST::RestError => e
          raise InvalidCommsProviderException, "Twilio provider could not connect #{e}"
        end

        true
    end
  end
end
