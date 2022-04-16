# frozen_string_literal: true

# Provides Twilio methods
module Communications
  @client = nil
  # :nodoc:
  module Twilio
    class TwilioController # :nodoc:
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

      def valid_request?(url, params, headers)
        auth_token = @client.password

        validator = ::Twilio::Security::RequestValidator.new(auth_token)

        twilio_signature = headers['X-Twilio-Signature']

        validator.validate(url, params, twilio_signature)
      end

      def conversation_id_param
        :CallSid
      end

      attr_reader :client
    end
  end
end
