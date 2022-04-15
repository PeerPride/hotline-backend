# frozen_string_literal: true

module API
  module V1
    class LanguagesController < API::BaseController # :nodoc:
      def index
        render jsonapi: Language.all
      end

      def show
        language = Language.find(params[:id])

        render jsonapi: line
      end

      def update
        language = Language.find(params[:id])
        # TODO
        render_jsonapi_response(language)
      end

      def destroy
        language = Language.find(params[:id])

        language.destroy
      end
    end
  end
end
