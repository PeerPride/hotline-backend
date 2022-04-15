# frozen_string_literal: true

module API
  module V1
    class IncomingLinesController < API::BaseController # :nodoc:
      def index
        render jsonapi: IncomingLine.all
      end

      def show
        line = IncomingLine.find(params[:id])

        render jsonapi: line
      end

      def update
        line = IncomingLine.find(params[:id])
        # TODO
        render_jsonapi_response(line)
      end

      def destroy
        line = IncomingLine.find(params[:id])

        line.destroy
      end

      def purchase; end
    end
  end
end
