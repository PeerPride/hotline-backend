# frozen_string_literal: true

module Communications
  @client = nil
  module Twilio
    class TwilioController
      def initialize
        connect

        # self.test_connection
      end

      def connect
        config_params = Setting.where(name: 'Phone Provider Settings').first.value
        config_params = JSON.parse(config_params)

        @client = ::Twilio::REST::Client.new config_params['account_sid'],
                                             config_params['auth_token']
      end

      def test_connection
        begin
          @client.api.accounts.list(limit: 1)
        rescue ::Twilio::REST::RestError => e
          raise InvalidCommsProviderException, "Twilio provider could not connect #{e}"
        end

        true
      end

      attr_reader :client
    end
  end
end
