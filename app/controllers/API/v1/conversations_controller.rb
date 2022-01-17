# frozen_string_literal: true

module API
  module V1
    class ConversationsController < API::BaseController # :nodoc:
      def index
        render json: Conversation.all
      end

      def show
        render_jsonapi_response(Conversation.find(params[:id]))
      end

      def update
        converation = Conversation.find(params[:id])
        converation.update!(permitted_params)
        render_jsonapi_response(converation)
      end

      def end
        converation = Conversation.find(params[:id])
        converation.finish

        render_jsonapi_response(converation)
      end

      private
        def permitted_params
          params.permit(:notes)
        end
    end
  end
end
