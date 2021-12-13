# frozen_string_literal: true

module API
  module V1
    class StatusController < API::BaseController # :nodoc:
      def index
        systemStatus = []

        systemStatus[:telephonyClient] = !@telephonyClient.nil?
        # TODO: If false, then dig into errors

        render json: systemStatus
      end
    end
  end
end
