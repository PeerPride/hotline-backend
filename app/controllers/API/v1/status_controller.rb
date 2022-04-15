# frozen_string_literal: true

module API
  module V1
    class StatusController < API::BaseController # :nodoc:
      def index
        system_status = []

        system_status[:telephonyClient] = !@telephonyClient.nil?
        # TODO: If false, then dig into errors

        render json: system_status
      end
    end
  end
end
